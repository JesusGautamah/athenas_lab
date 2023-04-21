# frozen_string_literal: true

# frozen_string_literak: true

# Home controller
class HomeController < ApplicationController
  def index
    @public_chats = Chat.where(public: true).order(created_at: :desc).paginate(page: params[:page], per_page: 3)
    @public_images = Chat.where(public: true).last(3).flat_map { |chat| chat.messages.flat_map(&:gen_images) }.last(3)
    @awesome_chatgpt_actors = AwesomeChatgptActors::CastControl.actors
  end

  def actors
    @awesome_chatgpt_actors = AwesomeChatgptActors::CastControl.actors
  end

  def bots; end
end
