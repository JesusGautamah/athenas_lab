# frozen_string_literal: true

json.array! @project_chats, partial: "project_chats/project_chat", as: :project_chat
