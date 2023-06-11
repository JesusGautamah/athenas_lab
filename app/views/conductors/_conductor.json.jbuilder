# frozen_string_literal: true

json.extract! conductor, :id, :board_project_id, :memory, :cast, :scene_id, :subconcious, :created_at, :updated_at
json.url conductor_url(conductor, format: :json)
