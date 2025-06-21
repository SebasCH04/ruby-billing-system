class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :product
  validates :product_id, :quantity, :unit_price, presence: true
end
