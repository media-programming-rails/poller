json.extract! participation_token, :id, :hash, :poll_id, :created_at, :updated_at
json.url participation_token_url(participation_token, format: :json)