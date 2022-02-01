class Compra < ApplicationRecord
  belongs_to :persona
  belongs_to :car
  belongs_to :operacion
end
