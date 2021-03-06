class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy ]

  # GET /sales or /sales.json
  def index
    @q = Sale.ransack(params[:q])
    @sales = @q.result(distinct: true)
  end

  # GET /sales/1 or /sales/1.json
  def show
  end

  def contratreserva
    @sale = Sale.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "contrato-reserva", template: "sales/contratreserva.html.erb", encoding: 'utf8'   # Excluding ".pdf" extension.
      end
    end
  end

    def contratreserva100
    @sale = Sale.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "contrato-reserva", template: "sales/contratreserva100.html.erb", encoding: 'utf8'   # Excluding ".pdf" extension.
      end
    end
  end

  def factura
    @sale = Sale.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "factura - #{@sale.numero}",
        template: "sales/factura.html.erb",
        encoding: 'utf8',
        header: { font_name: "Arial"}
       end
    end
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to sale_url(@sale), notice: "Sale was successfully created." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to sale_url(@sale), notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url, notice: "Sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sale_params
      params.require(:sale).permit(:precio, :iva, :fecha, :persona_id, :car_id, :operacion_id, :numero, :coche_cambio, :coche_cambio_precio, :coche_cambio_modelo, :coche_cambio_km, :coche_cambio_matricula, :coche_cambio_ano, :reserva, :factura, :garantia, :marti )
    end
end
