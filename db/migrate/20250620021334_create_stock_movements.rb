class CreateStockMovements < ActiveRecord::Migration[8.0]
  def change
    create_table :stock_movements do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.string :note
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
