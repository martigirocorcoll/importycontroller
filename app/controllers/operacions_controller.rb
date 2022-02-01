class OperacionsController < ApplicationController
  before_action :set_operacion, only: %i[ show edit update destroy ]

  # GET /operacions or /operacions.json
  def index
    @operacions = Operacion.all
  end

  # GET /operacions/1 or /operacions/1.json
  def show
  end

  # GET /operacions/new
  def new
    @operacion = Operacion.new
  end

  # GET /operacions/1/edit
  def edit
  end

  # POST /operacions or /operacions.json
  def create
    @operacion = Operacion.new(operacion_params)

    respond_to do |format|
      if @operacion.save
        format.html { redirect_to operacion_url(@operacion), notice: "Operacion was successfully created." }
        format.json { render :show, status: :created, location: @operacion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operacions/1 or /operacions/1.json
  def update
    respond_to do |format|
      if @operacion.update(operacion_params)
        format.html { redirect_to operacion_url(@operacion), notice: "Operacion was successfully updated." }
        format.json { render :show, status: :ok, location: @operacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operacions/1 or /operacions/1.json
  def destroy
    @operacion.destroy

    respond_to do |format|
      format.html { redirect_to operacions_url, notice: "Operacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operacion
      @operacion = Operacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def operacion_params
      params.require(:operacion).permit(:estado, :comercial)
    end
end