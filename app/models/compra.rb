class Compra < ApplicationRecord
  belongs_to :persona
  belongs_to :car
  belongs_to :operacion
  has_many :pagos, dependent: :destroy
  has_one_attached :factura

  def completo
    apagar = self.pagos.pluck(:cantidad).sum
    if self.precio > apagar
      return "Incompleto"
    elsif self.precio == apagar
      return "Completo"
    else
      self.pagos.each do |pago|
        if pago.tipo == "cash"
          return "Bompleto"
        end
      end
      return "Exceso"
    end
  end

  def pagado
    suma = 0
    self.pagos.each do |pago|
      unless pago.fecha_efectiva == nil
        suma += pago.cantidad.to_f
      end
    end
    return suma
  end

  def pendiente_pago
    self.pagos.pluck(:cantidad).sum - self.pagado
  end

  def penndiente_pago
    self.precio - self.pagado
  end
end
