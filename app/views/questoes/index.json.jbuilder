json.array!(@questoes) do |questao|
  json.extract! questao, :id, :descricao
  json.url questao_url(questao, format: :json)
end
