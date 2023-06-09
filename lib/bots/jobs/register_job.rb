# frozen_string_literal: true

require "sidekiq"

module ChatgptAssistant
  # This class is responsible to background the register service
  class RegisterJob
    include Sidekiq::Job

    sidekiq_options queue: :register

    def perform(email, password, chat_id)
      RegisterService.new(email, password, chat_id).call
    end
  end
end
