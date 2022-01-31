json.extract! persona, :id, :nombre, :apellido, :mail, :telefono, :direccion, :ciudad, :cp, :pais, :cif, :created_at, :updated_at
json.url persona_url(persona, format: :json)
