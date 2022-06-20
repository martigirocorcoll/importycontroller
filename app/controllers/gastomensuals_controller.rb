class GastomensualsController < ApplicationController
  before_action :set_gastomensual, only: %i[ show edit update destroy ]

  # GET /gastomensuals or /gastomensuals.json
  def index
    @gastomensuals = Gastomensual.all
  end

  # GET /gastomensuals/1 or /gastomensuals/1.json
  def show
  end

  # GET /gastomensuals/new
  def new
    @gastomensual = Gastomensual.new
  end

  # GET /gastomensuals/1/edit
  def edit
  end

  # POST /gastomensuals or /gastomensuals.json
  def create
    @gastomensual = Gastomensual.new(gastomensual_params)

    respond_to do |format|
      if @gastomensual.save
        format.html { redirect_to gastomensual_url(@gastomensual), notice: "Gastomensual was successfully created." }
        format.json { render :show, status: :created, location: @gastomensual }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gastomensual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gastomensuals/1 or /gastomensuals/1.json
  def update
    respond_to do |format|
      if @gastomensual.update(gastomensual_params)
        format.html { redirect_to gastomensual_url(@gastomensual), notice: "Gastomensual was successfully updated." }
        format.json { render :show, status: :ok, location: @gastomensual }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gastomensual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gastomensuals/1 or /gastomensuals/1.json
  def destroy
    @gastomensual.destroy

    respond_to do |format|
      format.html { redirect_to gastomensuals_url, notice: "Gastomensual was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gastomensual
      @gastomensual = Gastomensual.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gastomensual_params
      params.require(:gastomensual).permit(:titol, :cantidad, :iva)
    end
end
