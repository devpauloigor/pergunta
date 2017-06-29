json.array!(@tempandos) do |tempando|
  json.extract! tempando, :id, :horario
  json.url tempando_url(tempando, format: :json)
end
