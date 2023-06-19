json.extract! clocked_in, :id, :start_date, :end_date, :duration, :user_id, :user, :created_at, :updated_at
json.url clocked_in_url(clocked_in, format: :json)
