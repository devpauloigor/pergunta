json.array!(@resultados) do |resultado|
  json.extract! resultado, :id, :provaaluno_id, :questao_id, :resposta_id, :correta
  json.url resultado_url(resultado, format: :json)
end
