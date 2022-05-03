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


  def interesnominal
    interesnominal = 0
    restante = self.cantidad.to_i
    self.flujos.each do |flujo|
      unless flujo.fecha_efectiva == nil
        dias = (flujo.fecha_efectiva - self.fecha).to_f
        interesnominal += flujo.cantidad.to_i * (dias/365) * self.interes.to_i / 100
        restante -= flujo.cantidad.to_i
      end
    end
    dias_restantes = (Date.today - self.fecha).to_f
    interesnominal += restante * (dias_restantes/365) * self.interes.to_i / 100

    return interesnominal.to_i
  end

  def total_bruto
    return self.cantidad.to_i + self.interesnominal
  end

  def retencion
    return (self.interesnominal * 0.1596638655).to_i
  end

  def pendiente
    suma = self.cantidad.to_i
    self.flujos.each do |flujo|
      unless flujo.fecha_efectiva == nil
        suma += -flujo.cantidad.to_i
      end
    end
    suma += self.interesnominal
    suma += -self.retencion
  end

  def self.deuda_importy
    deuda = 0
    Prestamo.where(prestatario: 100).each do |prestamo|
      if prestamo.prestatario.id == 101
        deuda += prestamo.pendiente
      end
    end
    return "#{deuda}€"
  end

  def self.deuda_marti
    deuda = 0
    Prestamo.all.each do |prestamo|
      if prestamo.prestatario == Persona.find_by_id(101)
        deuda += prestamo.pendiente
      end
    end
    return "#{deuda}€"
  end

end
