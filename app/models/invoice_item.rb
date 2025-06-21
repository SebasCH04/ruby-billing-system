class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
  belongs_to :tax_rate

  validates :product, :tax_rate, :quantity, :unit_price, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :unit_price, numericality: { greater_than_or_equal_to: 0 }
end
