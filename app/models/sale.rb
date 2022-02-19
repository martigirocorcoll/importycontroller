class Sale < ApplicationRecord
  belongs_to :persona
  belongs_to :car
  belongs_to :operacion
  has_many :cobros, dependent: :destroy

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
    self.precio - self.cobrado
  end

end
