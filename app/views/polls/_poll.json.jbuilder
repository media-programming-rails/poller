json.extract! poll, :id, :name, :description, :instant_result, :public_result, :open, :answer_type, :created_at, :updated_at
json.url poll_url(poll, format: :json)