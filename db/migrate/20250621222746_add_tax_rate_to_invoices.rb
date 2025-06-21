class AddTaxRateToInvoices < ActiveRecord::Migration[8.0]
  def change
    add_column :invoices, :tax_rate_id, :integer
  end
end
