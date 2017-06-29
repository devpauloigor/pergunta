json.array!(@sub_grupos) do |sub_grupo|
  json.extract! sub_grupo, :id, :nome
  json.url sub_grupo_url(sub_grupo, format: :json)
end
