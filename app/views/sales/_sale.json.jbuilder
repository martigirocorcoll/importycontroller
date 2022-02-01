json.extract! sale, :id, :precio, :iva, :fecha, :persona_id, :car_id, :operacion_id, :numero, :coche_cambio, :coche_cambio_precio, :coche_cambio_iva, :created_at, :updated_at
json.url sale_url(sale, format: :json)
