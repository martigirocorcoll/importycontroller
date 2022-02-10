class Compra < ApplicationRecord
  belongs_to :persona
  belongs_to :car
  belongs_to :operacion
  has_many :pagos, dependent: :destroy
end
