# frozen_string_literal: true

json.extract! project_chat, :id, :board_project_id, :chat_id, :function_title, :created_at, :updated_at
json.url project_chat_url(project_chat, format: :json)
