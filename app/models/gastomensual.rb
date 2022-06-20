class Gastomensual < ApplicationRecord

  def self.basetotal
    return Gastomensual.all.pluck(:cantidad).sum
  end

  def self.ivatotal
    return Gastomensual.all.pluck(:iva).sum
  end

end
