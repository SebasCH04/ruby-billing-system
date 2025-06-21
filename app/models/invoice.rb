class Invoice < ApplicationRecord
  belongs_to :client
  has_many :invoice_items, inverse_of: :invoice, dependent: :destroy
  accepts_nested_attributes_for :invoice_items, allow_destroy: true, reject_if: :all_blank
  before_validation :assign_sequential_number, on: :create
  validates :number, presence: true, uniqueness: true
  before_create :assign_sequential_number

  private

  def assign_sequential_number
    last = Invoice.maximum("CAST(number AS INTEGER)").to_i
    next_num = last + 1
    self.number = next_num.to_s.rjust(6, "0")
  end
end
