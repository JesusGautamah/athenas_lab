# frozen_string_literal: true

class ScenesController < ApplicationController
  before_action :set_scene, only: %i[show edit update destroy]

  # GET /scenes or /scenes.json
  def index
    @scenes = Scene.all
  end

  # GET /scenes/1 or /scenes/1.json
  def show; end

  # GET /scenes/new
  def new
    @scene = Scene.new
  end

  # GET /scenes/1/edit
  def edit; end

  # POST /scenes or /scenes.json
  def create
    @scene = Scene.new(scene_params)

    respond_to do |format|
      if @scene.save
        format.html { redirect_to scene_url(@scene), notice: "Scene was successfully created." }
        format.json { render :show, status: :created, location: @scene }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenes/1 or /scenes/1.json
  def update
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to scene_url(@scene), notice: "Scene was successfully updated." }
        format.json { render :show, status: :ok, location: @scene }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @scene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenes/1 or /scenes/1.json
  def destroy
    @scene.destroy

    respond_to do |format|
      format.html { redirect_to scenes_url, notice: "Scene was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @scene = Scene.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def scene_params
      params.require(:scene).permit(:past_points, :initial_point, :actual_point, :objective_point, :board_project_id)
    end
end
