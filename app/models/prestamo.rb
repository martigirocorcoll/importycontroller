class Prestamo < ApplicationRecord
  belongs_to :prestamista, :class_name => "Persona", optional: true
  belongs_to :prestatario, :class_name => "Persona", optional: true
  has_one_attached :contrato
  has_one_attached :modelo
  has_one_attached :diligencia
  has_many :flujos, dependent: :destroy

end
