class Encuentro < ApplicationRecord
  has_many :conciertos, dependent: :destroy
  has_many :presentaciones, through: :conciertos
  has_many :artistas, -> { distinct }, through: :presentaciones
  has_many :artistas_visibles, dependent: :destroy

  has_one_attached :afiche

  has_many_attached :fotos

  def artistas_asociables
    [['==', 0]] + Artista.where.not(id: artistas).pluck(:nombre, :id)
  end
end
