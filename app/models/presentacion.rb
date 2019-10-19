class Presentacion < ApplicationRecord
  belongs_to :concierto
  has_many :obras_presentaciones
  has_many :artistas_presentaciones
  has_many :obras, through: :obras_presentaciones
  has_many :artistas, through: :artistas_presentaciones

  def obras_asociables
    Obra.where.not(id: obras).pluck(:titulo, :id)
  end

  def artistas_asociables
    Artista.where.not(id: artistas).pluck(:nombre, :id)
  end
end
