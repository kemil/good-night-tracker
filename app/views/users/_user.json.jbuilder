json.extract! user, :id, :name, :created_at, :updated_at, :followers, :followings, :clocked_ins
json.url user_url(user, format: :json)
