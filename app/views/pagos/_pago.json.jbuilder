json.extract! pago, :id, :cantidad, :fecha_teorica, :fecha_efectiva, :compra_id, :tipo, :created_at, :updated_at
json.url pago_url(pago, format: :json)
