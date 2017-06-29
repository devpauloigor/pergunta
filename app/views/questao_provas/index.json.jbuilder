json.array!(@questao_provas) do |questao_prova|
  json.extract! questao_prova, :id, :prova_id, :questao_id
  json.url questao_prova_url(questao_prova, format: :json)
end
