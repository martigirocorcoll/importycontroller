json.extract! operacion, :id, :estado, :venedor, :created_at, :updated_at
json.url operacion_url(operacion, format: :json)
