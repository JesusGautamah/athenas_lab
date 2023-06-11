# frozen_string_literal: true

json.extract! board_project, :id, :chats_count, :title, :descriptiomn, :markdown, :ipynb, :created_at, :updated_at
json.url board_project_url(board_project, format: :json)
