# frozen_string_literal: true

# frozen_string_literak: true

# Home controller
class HomeController < ApplicationController
  def index
    @public_chats = Chat.where(public: true).order(created_at: :desc).last(10)
    @public_images = @public_chats.map(&:messages).flatten.map(&:gen_images)
    @awesome_chatgpt_actors = AwesomeChatgptActors::CastControl.actors
  end

  def actors
    @awesome_chatgpt_actors = AwesomeChatgptActors::CastControl.actors
  end

  def bots; end
end
