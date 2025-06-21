class StockMovement < ApplicationRecord
  belongs_to :product
  validates :quantity, presence: true, numericality: { only_integer: true }
  validates :occurred_at, presence: true
end
