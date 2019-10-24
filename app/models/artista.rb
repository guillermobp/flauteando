class Artista < ApplicationRecord
  has_many :artistas_presentaciones

  has_many :presentaciones, through: :artistas_presentaciones

  has_many :conciertos, through: :presentaciones
  has_many :encuentros, through: :presentaciones

  has_one_attached :foto

  def Artista.for_select
    all.map { |x| [x.nombre, x.id] }
  end

  def visible?(encuentro)
    ArtistaVisible.exists?(artista: self, encuentro: encuentro)
  end
end
