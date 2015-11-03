json.array!(@activities) do |activity|
  json.extract! activity, :id, :user_id, :amount, :points
  json.url activity_url(activity, format: :json)
end
