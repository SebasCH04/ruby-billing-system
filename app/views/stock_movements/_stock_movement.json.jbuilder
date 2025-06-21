json.extract! stock_movement, :id, :product_id, :quantity, :note, :occurred_at, :created_at, :updated_at
json.url stock_movement_url(stock_movement, format: :json)
