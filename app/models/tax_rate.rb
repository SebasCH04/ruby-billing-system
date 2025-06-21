class TaxRate < ApplicationRecord
  #relaciones
  has_many :invoice_items, dependent: :restrict_with_error

  #validaciones
  validates :name, presence: true
  validates :rate, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }
end
