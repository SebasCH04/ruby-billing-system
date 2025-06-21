class RemoveTaxRateIdFromInvoiceItems < ActiveRecord::Migration[8.0]
  def change
    remove_column :invoice_items, :tax_rate_id, :integer
  end
end
