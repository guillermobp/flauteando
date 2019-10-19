class Encuentro < ApplicationRecord
  has_many :conciertos
  has_many :presentaciones, through: :conciertos
  has_many :artistas, -> { distinct }, through: :presentaciones

  has_one_attached :afiche

  has_many_attached :fotos

  def artistas_asociables
    [['==', 0]] + Artista.where.not(id: artistas).pluck(:nombre, :id)
  end

  def artistas_visibles
    Artista.where(id: ArtistaVisible.where(encuentro: self))
  end
end
