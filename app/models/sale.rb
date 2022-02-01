class Sale < ApplicationRecord
  belongs_to :persona
  belongs_to :car
  belongs_to :operacion
  has_many :cobros
end
