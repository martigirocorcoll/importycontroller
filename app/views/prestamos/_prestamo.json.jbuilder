json.extract! prestamo, :id, :fecha, :cantidad, :created_at, :updated_at
json.url prestamo_url(prestamo, format: :json)
