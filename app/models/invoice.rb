class Invoice < ApplicationRecord
  belongs_to :client
  belongs_to :tax_rate, optional: true
  has_many :invoice_items, inverse_of: :invoice, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, allow_destroy: true, reject_if: :all_blank
  before_validation :assign_sequential_number, on: :create
  before_validation :calculate_totals, on: [:create, :update]
  before_create :assign_sequential_number
  validates :client_id, :issued_at, :number, :subtotal, :tax_total, :total, presence: true
  validates :number, uniqueness: true

  after_commit :decrement_product_stock, on: :create

  def subtotal
    invoice_items.sum { |item| item.quantity.to_f * item.unit_price.to_f }
  end

  def tax_total
    subtotal * (tax_rate&.rate.to_f)
  end

  def total
    subtotal + tax_total
  end

  private

  def calculate_totals
    self.subtotal  = invoice_items.sum { |item| item.quantity.to_f * item.unit_price.to_f }
    self.tax_total = subtotal * (tax_rate&.rate.to_f)
    self.total     = subtotal + tax_total
  end

  def assign_sequential_number
    last = Invoice.maximum("CAST(number AS INTEGER)").to_i
    next_num = last + 1
    self.number = next_num.to_s.rjust(6, "0")
  end

  def decrement_product_stock
    invoice_items.each do |item|
      product = item.product
      next unless product && item.quantity.to_i > 0
      product.stock_quantity = product.stock_quantity.to_i - item.quantity.to_i
      product.save!
    end
  end
end
