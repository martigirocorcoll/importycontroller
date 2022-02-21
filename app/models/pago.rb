class Pago < ApplicationRecord
  belongs_to :compra
  has_one_attached :justificante
end
