class Cobro < ApplicationRecord
  belongs_to :sale
  has_one_attached :justificante
end
