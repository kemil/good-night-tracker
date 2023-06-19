
  json.id user.id
  json.name user.name

  json.followers user.followers
  json.followings user.followings

  json.clocked_ins user.clocked_ins do |clocked_in|
    json.id clocked_in.id
    json.start_date clocked_in.start_date
    json.end_date clocked_in.end_date
    json.duration clocked_in.duration
  end
  json.url user_url(user, format: :json)
