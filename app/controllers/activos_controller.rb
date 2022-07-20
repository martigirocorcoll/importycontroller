class ActivosController < ApplicationController
  before_action :set_activo, only: %i[ show edit update destroy ]

  # GET /activos or /activos.json
  def index
    @activos = Activo.all
  end

  # GET /activos/1 or /activos/1.json
  def show
  end

  # GET /activos/new
  def new
    @activo = Activo.new
  end

  # GET /activos/1/edit
  def edit
  end

  # POST /activos or /activos.json
  def create
    @activo = Activo.new(activo_params)

    respond_to do |format|
      if @activo.save
        format.html { redirect_to activo_url(@activo), notice: "Activo was successfully created." }
        format.json { render :show, status: :created, location: @activo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activos/1 or /activos/1.json
  def update
    respond_to do |format|
      if @activo.update(activo_params)
        format.html { redirect_to activo_url(@activo), notice: "Activo was successfully updated." }
        format.json { render :show, status: :ok, location: @activo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activos/1 or /activos/1.json
  def destroy
    @activo.destroy

    respond_to do |format|
      format.html { redirect_to activos_url, notice: "Activo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activo
      @activo = Activo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activo_params
      params.require(:activo).permit(:titular, :tipo, :descripcion, :cantidad)
    end
end
