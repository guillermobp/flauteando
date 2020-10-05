class Encuentro < ApplicationRecord
  # has_many :conciertos, dependent: :destroy
  # has_many :presentaciones, through: :conciertos
  # has_many :artistas, -> { distinct }, through: :presentaciones
  # has_many :artistas_visibles, dependent: :destroy
  # has_many :fechas_actividades, dependent: :destroy
  # has_many :actividades, through: :fechas_actividades

  has_many :actividades#, -> { order(:inicio) }
  has_many :participantes, -> { distinct }, through: :actividades
  has_many :etiquetas, -> { distinct }, through: :actividades
  # has_many :fechas, -> { distinct }, through: :actividades
  # has_many :fechas, through: :actividades
  has_many :slides

  has_one_attached :afiche

  has_many_attached :fotos

  def artistas_visibilizables
    Artista.all.where.not(id: artistas_visibles.pluck(:artista_id))
  end

  def artistas_visibles
    []
  end

  def fechas_actividades
    actividades.distinct.pluck(:fecha)
  end

  def fechas
    actividades.distinct.pluck(:fecha)
  end

  def fechas_actividades_short
    fechas.map { |x| x.strftime('%d/%m/%Y') }
  end

  def fechas_calendario
    fechas.map { |x| [
      x.strftime('%A'),
      x.strftime('%d de octubre'),
      I18n.l(x, format: :day_name_day_number_month_name),
      I18n.l(x, format: :day_name_day_number),
    ] }
  end

  def nombres_etiquetas
    etiquetas.pluck(:nombre)
  end

  def calendario_encuentro
    etiquetas.last.actividades.group_by(&:fecha).each { |fecha, actividades| puts actividades.count }
  end

  def conciertos_by_date
    conciertos.group_by(&:fecha)
  end

  def first_activity
    actividades.pluck(:inicio).sort.first.to_s.split(' UTC').join
    # '2020-11-06 21:00:00'
  end

  def last_activity
    actividades.pluck(:inicio).sort.last.to_s.split(' UTC').join
  end

end
