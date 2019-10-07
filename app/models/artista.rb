class Artista < ApplicationRecord
  has_many :presentaciones
  has_many :encuentros, through: :presentaciones
end
