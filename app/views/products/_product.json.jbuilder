json.extract! product, :id, :name, :sku, :price, :stock_quantity, :reorder_threshold, :created_at, :updated_at
json.url product_url(product, format: :json)
