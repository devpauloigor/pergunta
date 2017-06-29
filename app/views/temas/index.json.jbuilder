json.array!(@temas) do |tema|
  json.extract! tema, :id, :descricao, :subgrupo_id
  json.url tema_url(tema, format: :json)
end
