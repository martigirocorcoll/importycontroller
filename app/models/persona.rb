class Persona < ApplicationRecord
  has_many :compras, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_one_attached :ident
end
