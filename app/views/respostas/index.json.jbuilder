json.array!(@respostas) do |resposta|
  json.extract! resposta, :id, :descricao, :correta
  json.url resposta_url(resposta, format: :json)
end
