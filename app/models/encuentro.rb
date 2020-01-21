class Encuentro < ApplicationRecord
  has_many :conciertos, dependent: :destroy
  has_many :presentaciones, through: :conciertos
  has_many :artistas, -> { distinct }, through: :presentaciones
  has_many :artistas_visibles, dependent: :destroy
  has_many :fechas, dependent: :destroy
  has_many :fechas_actividades, through: :fechas
  has_many :actividades, through: :fechas_actividades

  has_one_attached :afiche

  has_many_attached :fotos

  def artistas_visibilizables
    artistas.where.not(id: artistas_visibles.pluck(:artista_id))
  end

  def conciertos_by_date
    conciertos.group_by(&:fecha)
  end
end
