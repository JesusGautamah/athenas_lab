# frozen_string_literal: true

module ChatgptAssistant
  # Helper for visit
  module VisitHelper
    def register_telegram_visitor
      Visitor.create(telegram_id: msg.chat.id, name: msg.from.first_name)
    end

    def discord_visited?(user_id)
      visitor = Visitor.find_by(discord_id: user_id, name: evnt.user.name)
      if visitor.nil?
        Visitor.create(discord_id: user_id, name: evnt.user.name)
      else
        visitor
      end
    end
  end
end
