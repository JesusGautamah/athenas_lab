# frozen_string_literal: true

json.array! @project_users, partial: "project_users/project_user", as: :project_user
