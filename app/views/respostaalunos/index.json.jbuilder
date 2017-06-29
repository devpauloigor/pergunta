json.array!(@respostaalunos) do |respostaaluno|
  json.extract! respostaaluno, :id, :provaaluno_id, :resposta_id
  json.url respostaaluno_url(respostaaluno, format: :json)
end
