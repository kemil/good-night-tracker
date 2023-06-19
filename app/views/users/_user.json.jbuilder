json.extract! user, :id, :name, :created_at, :updated_at, :followers, :followings, :clocked_ins: {clocked_in, :id, :start_date, :end_date, :duration, :user_id, :user, :created_at, :updated_at}
json.url user_url(user, format: :json)
