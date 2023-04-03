json.extract! chat, :id, :user_id, :status, :title, :created_at, :updated_at
json.url chat_url(chat, format: :json)
