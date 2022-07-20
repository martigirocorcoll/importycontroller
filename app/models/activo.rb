class Activo < ApplicationRecord


  def self.cash_importy
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Importy Garage SL" && activo.tipo == "Cash"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.percobrarct_importy
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Importy Garage SL" && activo.tipo == "Per cobrar c/t"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.percobrarllt_importy
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Importy Garage SL" && activo.tipo == "Per cobrar ll/t"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.cotxestock_importy
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Importy Garage SL" && activo.tipo == "Cotxes Stock"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.actius_importy
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Importy Garage SL" && activo.tipo == "Actius"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.activo_importy
    return Activo.cash_importy + Activo.percobrarct_importy + Activo.percobrarllt_importy + Activo.cotxestock_importy + Activo.actius_importy
  end

  def self.deutect_importy
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Importy Garage SL" && activo.tipo == "Deute c/t"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.deutellt_importy
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Importy Garage SL" && activo.tipo == "Deute ll/t"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.impostos_importy
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Importy Garage SL" && activo.tipo == "Impostos aplaçats"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.pasivo_importy
    return Activo.deutect_importy + Activo.deutellt_importy + Activo.impostos_importy
  end

  def self.patrimonio_importy
    return Activo.activo_importy - Activo.pasivo_importy
  end

# ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  def self.cash_marti
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Àngel i Martí" && activo.tipo == "Cash"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.percobrarct_marti
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Àngel i Martí" && activo.tipo == "Per cobrar c/t"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.percobrarllt_marti
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Àngel i Martí" && activo.tipo == "Per cobrar ll/t"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.cotxestock_marti
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Àngel i Martí" && activo.tipo == "Cotxes Stock"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.actius_marti
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Àngel i Martí" && activo.tipo == "Actius"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.activo_marti
    return Activo.cash_marti + Activo.percobrarct_marti + Activo.percobrarllt_marti + Activo.cotxestock_marti + Activo.actius_marti
  end

  def self.deutect_marti
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Àngel i Martí" && activo.tipo == "Deute c/t"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.deutellt_marti
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Àngel i Martí" && activo.tipo == "Deute ll/t"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.impostos_marti
    sum = 0
    Activo.all.each do |activo|
      if activo.titular == "Àngel i Martí" && activo.tipo == "Impostos aplaçats"
        sum += activo.cantidad
      end
    end
    return sum
  end

  def self.pasivo_marti
    return Activo.deutect_marti + Activo.deutellt_marti + Activo.impostos_marti
  end

  def self.patrimonio_marti
    return Activo.activo_marti - Activo.pasivo_marti
  end


  def self.patrimonio
    return Activo.patrimonio_marti + Activo.patrimonio_importy
  end

  def self.polissa_total
    sum = 0
    Activo.all.each do |activo|
      if activo.tipo == "Polissa"
        sum += activo.cantidad
      end
    end
    return sum
  end


end
