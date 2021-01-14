json.extract! event, :id, :name, :body, :date, :status, :created_at, :updated_at
json.url event_url(event, format: :json)
