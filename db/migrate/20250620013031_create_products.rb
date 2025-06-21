class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.decimal :price, precision: 10, scale: 2
      t.integer :stock_quantity
      t.integer :reorder_threshold

      t.timestamps
    end
  end
end
