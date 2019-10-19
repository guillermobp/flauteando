class Artista < ApplicationRecord
  has_many :artistas_presentaciones
  has_many :presentaciones, through: :artistas_presentaciones
  has_many :conciertos, through: :presentaciones
  has_many :encuentros, through: :presentaciones

  has_one_attached :foto
end
