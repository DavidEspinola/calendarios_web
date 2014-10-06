json.array!(@objetos) do |objeto|
  json.extract! objeto, :id, :nombre, :bio, :age, :fecha
  json.url objeto_url(objeto, format: :json)
end
