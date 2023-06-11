# frozen_string_literal: true

json.array! @board_projects, partial: "board_projects/board_project", as: :board_project
