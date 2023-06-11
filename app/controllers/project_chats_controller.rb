# frozen_string_literal: true

class ProjectChatsController < ApplicationController
  before_action :set_project_chat, only: %i[show edit update destroy]

  # GET /project_chats or /project_chats.json
  def index
    @project_chats = ProjectChat.all
  end

  # GET /project_chats/1 or /project_chats/1.json
  def show; end

  # GET /project_chats/new
  def new
    @project_chat = ProjectChat.new
  end

  # GET /project_chats/1/edit
  def edit; end

  # POST /project_chats or /project_chats.json
  def create
    @project_chat = ProjectChat.new(project_chat_params)

    respond_to do |format|
      if @project_chat.save
        format.html { redirect_to project_chat_url(@project_chat), notice: "Project chat was successfully created." }
        format.json { render :show, status: :created, location: @project_chat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_chats/1 or /project_chats/1.json
  def update
    respond_to do |format|
      if @project_chat.update(project_chat_params)
        format.html { redirect_to project_chat_url(@project_chat), notice: "Project chat was successfully updated." }
        format.json { render :show, status: :ok, location: @project_chat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_chats/1 or /project_chats/1.json
  def destroy
    @project_chat.destroy

    respond_to do |format|
      format.html { redirect_to project_chats_url, notice: "Project chat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project_chat
      @project_chat = ProjectChat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_chat_params
      params.require(:project_chat).permit(:board_project_id, :chat_id, :function_title)
    end
end
