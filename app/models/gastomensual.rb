class Gastomensual < ApplicationRecord

  def self.basetotal
    return Gastomensual.all.pluck(:cantidad).sum
  end
end
