json.extract! compra, :id, :precio, :iva, :fecha, :tipo, :categoria, :persona_id, :car_id, :operacio_id, :created_at, :updated_at
json.url compra_url(compra, format: :json)
