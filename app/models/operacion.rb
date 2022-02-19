class Operacion < ApplicationRecord
  has_many :compras, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :pagos, through: :compras
  has_many :cobros, through: :sales
  has_many :cars, through: :sales


  def pendiente
    pcobro = 0
    ppago = 0
    self.sales.each do |sale|
      pcobro += sale.pendiente_cobro
    end
    self.compras.each do |compra|
      ppago += compra.pendiente_pago
    end
    return pcobro - ppago
  end


  #FUNCIONAmodel que en cas de operacio rebu, l'iva dels gastos computa al restar marge de la operacio
  def margen_neto_iva_si_resta
    gastos = 0
    if self.sales.exists?
      unless self.sales.first.iva == 0.0
        gastosbruto = 0
        ingreso = self.sales.first.precio
        self.compras.each do |compra|
          gastos += compra.precio
          if compra.iva == 0.0
            gastosbruto += compra.precio
          end
        end
        return ((ingreso - gastos) / 1.21 - 0.17355372*(gastosbruto)).to_i
      else
        ingreso = self.sales.first.precio
        self.compras.each do |compra|
          gastos += compra.precio
        end
        return ((ingreso - gastos) / 1.21).to_i
      end
    else
      gastosbruto = 0
      ingreso = 0
      self.compras.each do |compra|
        gastos += compra.precio
      end
      return ((ingreso - gastos)/ 1.21).to_i
    end
  end

  def iva_iva_si_resta
    gastos = 0
    if self.sales.exists?
      if self.sales.first.iva != 0.0
        gastosbruto = 0
        ingreso = self.sales.first.precio
        self.compras.each do |compra|
          gastos += compra.precio
          if compra.iva == 0.0
            gastosbruto += compra.precio
          end
        end
        return ((ingreso - gastos)/ 1.21 * 0.21 + 0.17355372 * (gastosbruto)).to_i
      else
        ingreso = self.sales.first.precio
        self.compras.each do |compra|
          gastos += compra.precio
        end
        if ((ingreso - gastos)/ 1.21 * 0.21).to_i > 0
          return ((ingreso - gastos)/ 1.21 * 0.21).to_i
        else
          return 0
        end
      end
    else
      gastosbruto = 0
      ingreso = 0
      self.compras.each do |compra|
        gastos += compra.precio
      end
      return ((ingreso - gastos)/ 1.21 * 0.21).to_i
    end
  end


  #model que en cas de operacio rebu, l'iva dels gastos no computa al restar marge de la operacio
  def margen_neto_iva_no_resta
    gastos = 0
    if self.sales.first.iva == 0.0
      gastosbruto = 0
      ingreso = self.sales.first.precio
      self.compras.each do |compra|
        gastos += compra.precio
        if compra.iva == 0.0
          gastosbruto += compra.precio
        end
      end
      return (ingreso - gastos)/1,21 - 0,17355372*(gastosbruto)
    else
      ingreso = self.sales.first.precio
      iva_compras = 0
      self.compras.each do |compra|
        gastos += compra.precio
        unless compra.iva == 0.0
          iva_compras += compra.iva
        end
      end
      return (ingreso - gastos + iva_compras) / 1,21
    end
  end

  def iva_iva_no_resta
    gastos = 0
    if self.sales.first.iva == 0.0
      gastosbruto = 0
      ingreso = self.sales.first.precio
      self.compras.each do |compra|
        gastos += compra.precio
        if compra.iva == 0.0
          gastosbruto += compra.precio
        end
      end
      return (ingreso - gastos)/1,21*0,21 + 0,17355372*(gastosbruto)
    else
      ingreso = self.sales.first.precio
      iva_compras = 0
      self.compras.each do |compra|
        gastos += compra.precio
        unless compra.iva == 0.0
          iva_compras += compra.iva
        end
      end
      return (ingreso - gastos + iva_compras) / 1,21 * 0,21
    end
  end
end
