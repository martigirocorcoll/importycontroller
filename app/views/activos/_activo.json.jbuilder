json.extract! activo, :id, :titular, :tipo, :descripcion, :cantidad, :created_at, :updated_at
json.url activo_url(activo, format: :json)
