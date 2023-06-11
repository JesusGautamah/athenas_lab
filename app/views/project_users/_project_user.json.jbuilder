# frozen_string_literal: true

json.extract! project_user, :id, :board_project_id, :user_id, :role, :created_at, :updated_at
json.url project_user_url(project_user, format: :json)
