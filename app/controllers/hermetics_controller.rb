class HermeticsController < ApplicationController
  before_action :set_hermetic, only: %i[show edit update destroy]

  # GET /hermetics or /hermetics.json
  def index
    @hermetics = Hermetic.all
  end

  # GET /hermetics/1 or /hermetics/1.json
  def show; end

  # GET /hermetics/new
  def new
    @hermetic = Hermetic.new
  end

  # GET /hermetics/1/edit
  def edit; end

  # POST /hermetics or /hermetics.json
  def create
    @hermetic = Hermetic.new(hermetic_params)

    respond_to do |format|
      if @hermetic.save
        format.html { redirect_to hermetic_url(@hermetic), notice: "Hermetic was successfully created." }
        format.json { render :show, status: :created, location: @hermetic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hermetic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hermetics/1 or /hermetics/1.json
  def update
    respond_to do |format|
      if @hermetic.update(hermetic_params)
        format.html { redirect_to hermetic_url(@hermetic), notice: "Hermetic was successfully updated." }
        format.json { render :show, status: :ok, location: @hermetic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hermetic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hermetics/1 or /hermetics/1.json
  def destroy
    @hermetic.destroy

    respond_to do |format|
      format.html { redirect_to hermetics_url, notice: "Hermetic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_hermetic
      @hermetic = Hermetic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hermetic_params
      params.require(:hermetic).permit(:laws)
    end
end
