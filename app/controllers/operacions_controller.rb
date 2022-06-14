class OperacionsController < ApplicationController
  before_action :set_operacion, only: %i[ show edit update destroy ]

  # GET /operacions or /operacions.json
  def index
    @q = Operacion.ransack(params[:q])
    @q.sorts = "id desc" if @q.sorts.empty?
    @operacions = @q.result(distinct: true)


    # pagos_test = []
    # Pago.where(fecha_efectiva: nil).order(:fecha_teorica).each do |pago|
    #   fechas_pago = pagos_test.map {|x| x[0] }
    #   if fechas_pago.include?(pago.fecha_teorica)
    #     i = fechas_pago.index(pago.fecha_teorica)
    #     pagos_test[i][1] -= pago.cantidad
    #   else
    #     pagos_test << [pago.fecha_teorica, - pago.cantidad]
    #   end
    # end
    # @pago_hash = pagos_test
    @arrays = []
    Pago.where(fecha_efectiva: nil).order(:fecha_teorica).each do |pago|
      @arrays << [pago.compra.operacion.titol, pago.fecha_teorica, - pago.cantidad]
    end
    Cobro.where(fecha_efectiva: nil).order(:fecha_teorica).each do |cobro|
      @arrays << [cobro.sale.operacion.titol, cobro.fecha_teorica, cobro.cantidad]
    end
    @arrays = @arrays.sort_by { |e| e[1].to_date }
    @data = []
    @arrays.each do |array|
      @data << { name: array[0], data: { array[1] => array[2] } }
    end
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
      params.require(:operacion).permit(:estado, :venedor, :titol, :comptabilitzat)
    end
end
