class CochesController < ApplicationController
  before_action :set_coch, only: %i[ show edit update destroy ]

  # GET /coches or /coches.json
  def index
    @coches = Coche.all
  end

  # GET /coches/1 or /coches/1.json
  def show
  end

  # GET /coches/new
  def new
    @coch = Coche.new
  end

  # GET /coches/1/edit
  def edit
  end

  # POST /coches or /coches.json
  def create
    @coch = Coche.new(coch_params)

    respond_to do |format|
      if @coch.save
        format.html { redirect_to coch_url(@coch), notice: "Coche was successfully created." }
        format.json { render :show, status: :created, location: @coch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @coch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coches/1 or /coches/1.json
  def update
    respond_to do |format|
      if @coch.update(coch_params)
        format.html { redirect_to coch_url(@coch), notice: "Coche was successfully updated." }
        format.json { render :show, status: :ok, location: @coch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @coch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coches/1 or /coches/1.json
  def destroy
    @coch.destroy

    respond_to do |format|
      format.html { redirect_to coches_url, notice: "Coche was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coch
      @coch = Coche.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coch_params
      params.require(:coch).permit(:marca, :modelo, :kilometraje, :primeramat, :chasis)
    end
end
