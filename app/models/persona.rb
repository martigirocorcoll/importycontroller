class Persona < ApplicationRecord
  has_many :compras, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_one_attached :ident
  has_many :prestamos_prestados, :class_name => "Prestamo", :foreign_key => "prestamista_id"
  has_many :prestamos_cobrados, :class_name => "Prestamo", :foreign_key => "prestatario_id"
end
