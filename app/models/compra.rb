class Compra < ApplicationRecord
  belongs_to :persona
  belongs_to :car
  belongs_to :operacion
  has_many :pagos, dependent: :destroy

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
    self.precio - self.pagado
  end
end
