class Sale < ApplicationRecord
  belongs_to :persona
  belongs_to :car
  belongs_to :operacion
  has_many :cobros, dependent: :destroy
  has_one_attached :reserva
  has_one_attached :factura
  has_one_attached :garantia

  def completo
    apagar = self.cobros.pluck(:cantidad).sum
    if self.precio > apagar
      return "Incompleto"
    elsif self.precio == apagar
      return "Completo"
    else
      self.cobros.each do |pago|
        if pago.tipo == "cash"
          return "Bompleto"
        end
      end
      return "Exceso"
    end
  end

  def cobrado
    suma = 0
    self.cobros.each do |pago|
      unless pago.fecha_efectiva == nil
        suma += pago.cantidad.to_f
      end
    end
    return suma
  end

  def pendiente_cobro
    self.cobros.pluck(:cantidad).sum - self.cobrado
  end


  def penndiente_cobro
    self.precio - self.cobrado
  end

end
