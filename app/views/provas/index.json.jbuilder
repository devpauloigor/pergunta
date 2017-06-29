json.array!(@provas) do |prova|
  json.extract! prova, :id, :nome
  json.url prova_url(prova, format: :json)
end
