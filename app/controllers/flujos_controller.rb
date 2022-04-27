class FlujosController < ApplicationController
  before_action :set_flujo, only: %i[ show edit update destroy ]

  # GET /flujos or /flujos.json
  def index
    @flujos = Flujo.all
  end

  # GET /flujos/1 or /flujos/1.json
  def show
  end

  # GET /flujos/new
  def new
    @flujo = Flujo.new
  end

  # GET /flujos/1/edit
  def edit
  end

  # POST /flujos or /flujos.json
  def create
    @flujo = Flujo.new(flujo_params)
    respond_to do |format|
      if @flujo.save
        format.html { redirect_to prestamo_path(params["flujo"]["prestamo_id"].to_i), notice: "Flujo was successfully created." }
        # format.html { redirect_to flujo_url(@flujo), notice: "Flujo was successfully created." }
        format.json { render :show, status: :created, location: @flujo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flujo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flujos/1 or /flujos/1.json
  def update
    respond_to do |format|
      if @flujo.update(flujo_params)
        # format.html { redirect_to pretamo_path(params["flujo"]["prestamo_id"].to_i)
        format.html { redirect_to prestamo_path(params["flujo"]["prestamo_id"].to_i), notice: "Flujo was successfully created." }
        format.json { render :show, status: :ok, location: @flujo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flujo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flujos/1 or /flujos/1.json
  def destroy
    @flujo.destroy

    respond_to do |format|
      format.html { redirect_to flujos_url, notice: "Flujo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flujo
      @flujo = Flujo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flujo_params
      params.require(:flujo).permit(:cantidad, :fecha_teorica, :fecha_efectiva, :prestamo_id)
    end
end
