class Car < ApplicationRecord
  has_many :compras, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many_attached :photos
  has_one_attached :papeles_aleman
  has_one_attached :papeles_esp
end
