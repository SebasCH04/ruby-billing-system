json.extract! invoice, :id, :client_id, :number, :issued_at, :subtotal, :tax_total, :total, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
