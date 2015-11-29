json.array!(@notifications) do |notification|
  json.extract! notification, :id, :topic, :subject, :message
  json.url notification_url(notification, format: :json)
end
