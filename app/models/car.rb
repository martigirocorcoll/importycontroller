class Car < ApplicationRecord
  has_many :compras
  has_many :sales
end
