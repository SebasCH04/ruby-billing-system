class Product < ApplicationRecord
  #relaciones
  has_many :stock_movements, dependent: :destroy
  has_many :invoice_items

  #despues de cada update, si cambio stock_quantity, se registra el movimiento
  after_update :record_stock_adjustment, if: :saved_change_to_stock_quantity?

  #callbacks
  before_validation :normalize_sku
  before_destroy :check_for_invoice_items

  #validaciones
  validates :name, :sku, :price, :stock_quantity, :reorder_threshold, presence: true
  validates :sku, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, :reorder_threshold, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  private

  #normaliza el SKU a mayusculas antes de validar
  def normalize_sku
    self.sku&.upcase!
  end

  #crea el movimiento con la diferencia
  def record_stock_adjustment
    old_qty, new_qty = saved_change_to_stock_quantity
    change = new_qty - old_qty
    stock_movements.create!(
      quantity: change,
      note: "Stock Changed: #{old_qty} → #{new_qty}",
      occurred_at: Time.current
    )
  end
end

def check_for_invoice_items
  if invoice_items.exists?
    errors.add(:base, "Cannot delete product with associated invoice items")
    throw(:abort)
  end
end