# frozen_string_literal: true

class ProjectUsersController < ApplicationController
  before_action :set_project_user, only: %i[show edit update destroy]

  # GET /project_users or /project_users.json
  def index
    @project_users = ProjectUser.all
  end

  # GET /project_users/1 or /project_users/1.json
  def show; end

  # GET /project_users/new
  def new
    @project_user = ProjectUser.new
  end

  # GET /project_users/1/edit
  def edit; end

  # POST /project_users or /project_users.json
  def create
    @project_user = ProjectUser.new(project_user_params)

    respond_to do |format|
      if @project_user.save
        format.html { redirect_to project_user_url(@project_user), notice: "Project user was successfully created." }
        format.json { render :show, status: :created, location: @project_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_users/1 or /project_users/1.json
  def update
    respond_to do |format|
      if @project_user.update(project_user_params)
        format.html { redirect_to project_user_url(@project_user), notice: "Project user was successfully updated." }
        format.json { render :show, status: :ok, location: @project_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_users/1 or /project_users/1.json
  def destroy
    @project_user.destroy

    respond_to do |format|
      format.html { redirect_to project_users_url, notice: "Project user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_project_user
      @project_user = ProjectUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_user_params
      params.require(:project_user).permit(:board_project_id, :user_id, :role)
    end
end
