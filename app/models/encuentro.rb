class Encuentro < ApplicationRecord
  default_scope { order(:version) }
  # has_many :conciertos, dependent: :destroy
  # has_many :presentaciones, through: :conciertos
  # has_many :artistas, -> { distinct }, through: :presentaciones
  # has_many :artistas_visibles, dependent: :destroy
  # has_many :fechas_actividades, dependent: :destroy
  # has_many :actividades, through: :fechas_actividades

  has_many :actividades#, -> { order(:fecha) }
  has_many :participantes, -> { distinct }, through: :actividades
  has_many :etiquetas, -> { distinct }, through: :actividades
  # has_many :fechas, -> { distinct }, through: :actividades
  # has_many :fechas, through: :actividades
  has_many :slides

  has_one_attached :reference_image
  has_one_attached :afiche

  has_many_attached :fotos

  def activities_by_start_time
    actividades.order(:inicio)
  end

  def artistas_visibilizables
    Artista.where.not(id: artistas_visibles.pluck(:artista_id))
  end

  def artistas_visibles
    []
  end

  def fechas_actividades
    actividades.distinct.pluck(:inicio)
  end

  def fechas
    actividades.map{ |a| a.inicio.beginning_of_day }.uniq
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
      x,
    ] }
  end

  def nombres_etiquetas
    etiquetas.pluck(:nombre)
  end

  def calendario_encuentro
    # etiquetas.last.actividades.group_by(&:fecha).each { |fecha, actividades| puts actividades.count }
    Encuentro.last.actividades.group_by{ |a| a.inicio.beginning_of_day }.each { |fecha, actividades| puts actividades.count }
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

  def reference_image_display
    reference_image.attached? ? reference_image : 'https://dummyimage.com/600x400/000/fff'
  end

  def past_events
    Encuentro.where.not(id: self.id).where(habilitado: true)
  end

  def show_countdown_text
    show_countdown? ? 'Ocultar' : 'Mostrar'
  end

  def show_countdown_class
    show_countdown? ? 'is-warning' : ''
  end

  def show_instagram_feed_text
    show_instagram_feed? ? 'Ocultar' : 'Mostrar'
  end

  def show_instagram_feed_class
    show_instagram_feed? ? 'is-warning' : ''
  end

  def enable_disable_text
    habilitado? ? 'Deshabilitar' : 'Habilitar'
  end

  def enable_disable_class
    habilitado? ? 'is-warning' : ''
  end

  def is_last?
    self == Encuentro.last
  end

  def is_last_enabled?
    self == Encuentro.where(habilitado: true).last
  end

  def is_past_event?
    !is_last?
  end

  def is_enabled_past_event?
    !is_last? and habilitado?
  end

  def has_past_events?
    Encuentro.where.not(id: id).exists?
  end

  def has_enabled_past_events?
    Encuentro.where.not(id: id).exists?(habilitado: true)
  end

  def show_countdown_section?
    is_last_enabled? and show_countdown?
  end

  def show_instagram_feed_section?
    show_instagram_feed?
  end

  def show_past_events_section?
    is_last_enabled? and show_past_events? and has_enabled_past_events?
  end

  def available_tags
    Etiqueta.all
  end

  def sorted_activities
    actividades.order(:inicio)
  end

end
