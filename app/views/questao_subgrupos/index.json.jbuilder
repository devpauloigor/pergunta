json.array!(@questao_subgrupos) do |questao_subgrupo|
  json.extract! questao_subgrupo, :id, :questao_id, :sub_grupo_id
  json.url questao_subgrupo_url(questao_subgrupo, format: :json)
end
