# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat, only: %i[show edit update destroy]

  # GET /chats or /chats.json
  def index
    @chats = current_user.chats.paginate(page: params[:page], per_page: 3)
  end

  # GET /chats/1 or /chats/1.json
  def show
    @messages = @chat.messages.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  # GET /chats/new
  def new
    @chat = Chat.new
    @awesome_chatgpt_actors = AwesomeChatgptActors::CastControl.actors
    @languages = %w[en es fr de it pt ru ja zh ko]
  end

  # GET /chats/1/edit
  def edit
    @awesome_chatgpt_actors = AwesomeChatgptActors::CastControl.actors
    @languages = %w[en es fr de it pt ru ja zh ko]
  end

  # POST /chats or /chats.json
  def create
    @awesome_chatgpt_actors = AwesomeChatgptActors::CastControl.actors
    @chat = Chat.new(chat_params)
    @chat.user = current_user

    respond_to do |format|
      if @chat.save
        format.html { redirect_to chat_url(@chat), notice: "Chat was successfully created." }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1 or /chats/1.json
  def update
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to chat_url(@chat), notice: "Chat was successfully updated." }
        format.json { render :show, status: :ok, location: @chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1 or /chats/1.json
  def destroy
    @chat.destroy

    respond_to do |format|
      format.html { redirect_to chats_url, notice: "Chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chat_params
      params.require(:chat).permit(:user_id, :status, :title, :public, :actor, :prompt,
                                   :language)
    end
end
