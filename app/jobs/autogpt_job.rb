# frozen_string_literal: true

# AutogptJob
class AutogptJob
  include Sidekiq::Worker

  def perform(board_project_id)
    AutogptService.new(board_project_id).call
  end
end
