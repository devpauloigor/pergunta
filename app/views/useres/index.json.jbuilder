json.array!(@useres) do |user|
  json.extract! user, :id, :email, :password, :password_confirmation, :nome, :perfil
  json.url user_url(user, format: :json)
end
