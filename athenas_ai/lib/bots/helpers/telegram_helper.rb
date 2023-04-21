# frozen_string_literal: true

module ChatgptAssistant
  # Helper for telegram
  module TelegramHelper
    def user
      @user = find_user(telegram_id: msg.chat.id)
    end

    def bot
      @bot ||= Telegram::Bot::Client.new(telegram_token)
    end

    def telegram_chat_event
      user ? chat_if_exists : not_logged_in_message
    end

    def telegram_user_create(visitor_id, email, password)
      visitor = Visitor.find_by(id: visitor_id)
      return false unless visitor

      visitor.tel_user.update(telegram_id: nil) if visitor.tel_user.present?
      user = User.new(telegram_id: visitor.telegram_id, email: email, password: password)
      user.save ? user.email : user.errors.full_messages
    end

    def telegram_send_start_message
      send_message common_messages[:start], msg.chat.id
      help_message = help_messages.join("\n").to_s
      send_message help_message, msg.chat.id
      send_message common_messages[:start_helper], msg.chat.id
      send_message common_messages[:start_sec_helper], msg.chat.id
    end

    def telegram_text_or_audio?
      msg.respond_to?(:text) || msg.respond_to?(:audio) || msg.respond_to?(:voice)
    end

    def telegram_message_has_text?
      msg.text.present?
    end

    def telegram_message_has_audio?
      msg.audio.present? || msg.voice.present?
    end

    def telegram_actions?
      msg.text.include?("new_chat/") || msg.text.include?("sl_chat/") || msg.text.include?("login/") || msg.text.include?("register/")
    end
  end
end
