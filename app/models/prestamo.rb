class Prestamo < ApplicationRecord
  belongs_to :prestamista, :class_name => "Persona", optional: true
  belongs_to :prestatario, :class_name => "Persona", optional: true
  has_one_attached :contrato
  has_one_attached :modelo
  has_one_attached :diligencia
  has_many :flujos, dependent: :destroy

  def declarado
    if self.contrato.attached? && self.modelo.attached? && self.diligencia.attached?
      return "Si"
    elsif self.contrato.attached? || self.modelo.attached? || self.diligencia.attached?
      return "Solo algo"
    else
      return "No"
    end
  end

  def devuelto
    suma = 0
    self.flujos.each do |flujo|
      unless flujo.fecha_efectiva == nil
        suma += flujo.cantidad.to_i
      end
    end
    if suma >= self.cantidad.to_i
      return "Si"
    else
      return "No"
    end
  end

end
