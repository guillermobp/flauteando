class Encuentro < ApplicationRecord
  has_many :presentaciones, -> { order :artista_id }
  has_many :artistas, through: :presentaciones

  has_one_attached :afiche

  def artistas_asociables
    [['==', 0]] + Artista.where.not(id: artistas).pluck(:nombre, :id)
  end
end
