json.extract! user, :id, :firstname, :lastname, :birthday, :email, :publickey, :created_at, :updated_at
json.url user_url(user, format: :json)
