# frozen_string_literal: true

json.extract! scene, :id, :past_points, :initial_point, :actual_point, :objective_point, :board_project_id, :created_at, :updated_at
json.url scene_url(scene, format: :json)
