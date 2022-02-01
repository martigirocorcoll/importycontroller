class Operacion < ApplicationRecord
  has_many :compras
  has_many :sales
  has_many :pagos, through: :compras
  has_many :cobros, through: :sales
  has_many :cars, through: :sales

  def margin
    self.sales.first.precio - self.compras.first.precio
  end
end
