json.array!(@provaalunos) do |provaaluno|
  json.extract! provaaluno, :id, :prova_id, :aluno_id, :status
  json.url provaaluno_url(provaaluno, format: :json)
end
