# frozen_string_literal: true

class BoardProjectsController < ApplicationController
  before_action :set_board_project, only: %i[show edit update destroy]

  # GET /board_projects or /board_projects.json
  def index
    @board_projects = current_user.board_projects.page(params[:page])
  end

  # GET /board_projects/1 or /board_projects/1.json
  def show; end

  # GET /board_projects/new
  def new
    @board_project = BoardProject.new
  end

  # GET /board_projects/1/edit
  def edit; end

  def autogpt
    @board_project = BoardProject.find(params[:id])
    AutogptJob.perform_async(@board_project.id)
    redirect_to @board_project, notice: "AutogptJob was successfully created."
  end

  def select_chat_to_add
    @board_project = BoardProject.find(params[:id])
    @chats = current_user.chats
  end

  def add_chat
    @board_project = BoardProject.find(params[:id])
    @chat = Chat.find(params[:chat_id])
    project_chat = ProjectChat.new(board_project: @board_project, chat: @chat)
    if project_chat.save
      redirect_to @board_project, notice: "Chat was successfully added."
    else
      redirect_to @board_project, notice: "Chat was not added."
    end
  end

  def select_chat_to_remove
    @board_project = BoardProject.find(params[:id])
    @chats = @board_project.chats
  end

  def remove_chat
    @board_project = BoardProject.find(params[:id])
    @chat = Chat.find(params[:chat_id])
    project_chat = ProjectChat.find_by(board_project: @board_project, chat: @chat)
    if project_chat.destroy
      redirect_to @board_project, notice: "Chat was successfully removed."
    else
      redirect_to @board_project, notice: "Chat was not removed."
    end
  end

  # POST /board_projects or /board_projects.json
  def create
    @board_project = BoardProject.new(board_project_params)
    @board_project.owner = current_user

    respond_to do |format|
      if @board_project.save
        format.html { redirect_to board_project_url(@board_project), notice: "Board project was successfully created." }
        format.json { render :show, status: :created, location: @board_project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /board_projects/1 or /board_projects/1.json
  def update
    respond_to do |format|
      if @board_project.update(board_project_params)
        format.html { redirect_to board_project_url(@board_project), notice: "Board project was successfully updated." }
        format.json { render :show, status: :ok, location: @board_project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_projects/1 or /board_projects/1.json
  def destroy
    @board_project.destroy

    respond_to do |format|
      format.html { redirect_to board_projects_url, notice: "Board project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_board_project
      @board_project = BoardProject.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_project_params
      params.require(:board_project).permit(:chats_count, :title, :description, :markdown, :ipynb)
    end
end
