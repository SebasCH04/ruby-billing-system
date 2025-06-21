class CreateTaxRates < ActiveRecord::Migration[8.0]
  def change
    create_table :tax_rates do |t|
      t.string :name
      t.decimal :rate, precision: 5, scale: 4

      t.timestamps
    end
  end
end
