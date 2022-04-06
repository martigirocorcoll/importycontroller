class PagosController < ApplicationController
  before_action :set_pago, only: %i[ show edit update destroy ]

  # GET /pagos or /pagos.json
  def index
    @q = Pago.ransack(params[:q])
    @pagos = @q.result(distinct: true)


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

    # cobros_test = []
    # Cobro.where(fecha_efectiva: nil).order(:fecha_teorica).each do |cobro|
    #   fechas_cobro = cobros_test.map {|x| x[0] }
    #   if fechas_cobro.include?(cobro.fecha_teorica)
    #     i = fechas_cobro.index(cobro.fecha_teorica)
    #     cobros_test[i][1] += cobro.cantidad
    #   else
    #     cobros_test << [cobro.fecha_teorica, cobro.cantidad]
    #   end
    # end
    # @cobro_hash = cobros_test

    # @data = [
    #   {name: "Cobros", data: @cobro_hash},
    #   {name: "Pagos", data: @pago_hash}
    # ]

  end

  # GET /pagos/1 or /pagos/1.json
  def show
  end

  # GET /pagos/new
  def new
    @pago = Pago.new
    unless params[:compra_id] == nil
    @compra = Compra.find(params["compra_id"])
    end
  end

  # GET /pagos/1/edit
  def edit
  end

  # POST /pagos or /pagos.json
  def create
    @pago = Pago.new(pago_params)

    respond_to do |format|
      if @pago.save
        format.html { redirect_to compra_path(params["pago"]["compra_id"].to_i), notice: "Pago was successfully created." }
        format.json { render :show, status: :created, location: @pago }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagos/1 or /pagos/1.json
  def update
    respond_to do |format|
      if @pago.update(pago_params)
        format.html { redirect_to compra_path(params["pago"]["compra_id"].to_i), notice: "Pago was successfully updated." }
        format.json { render :show, status: :ok, location: @pago }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos/1 or /pagos/1.json
  def destroy
    @pago.destroy

    respond_to do |format|
      format.html { redirect_to pagos_url, notice: "Pago was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pago
      @pago = Pago.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pago_params
      params.require(:pago).permit(:cantidad, :fecha_teorica, :fecha_efectiva, :compra_id, :tipo, :justificante)
    end
end
