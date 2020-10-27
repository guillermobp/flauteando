class Actividad < ApplicationRecord
  # default_scope { order(:fecha, :inicio) }
  # belongs_to :fecha_actividad
  # has_one :encuentro, through: :fecha_actividad
  belongs_to :encuentro

  has_many :actividades_etiquetas, dependent: :destroy
  has_many :etiquetas, through: :actividades_etiquetas

  has_many :actividades_participantes, dependent: :destroy
  has_many :participantes, through: :actividades_participantes

  def date
    inicio.beginning_of_day
  end

  def fecha_day_name
    inicio.strftime('%A')
  end

  def fecha_day_of_month_long
    inicio.strftime('%d de %B')
  end

  def fecha_day_name_day_number
    I18n.l(inicio, format: :day_name_day_number)
  end

  def inicio_hhmm
    inicio.strftime('%H:%M')
  end

  def termino_hhmm
    termino.nil? ? '' : termino.strftime('%H:%M')
  end

  def inicio_termino_hhmm
    if termino.nil?
      return inicio_hhmm
    end

    "#{inicio_hhmm} - #{termino_hhmm}"
  end

  # def inicio_termino_hhmm_ary
  #   if termino.nil?
  #     return [ inicio_hhmm ]
  #   end
  #
  #   [ inicio_hhmm, termino_hhmm ]
  # end

  def inicio_termino_hhmm_ary
    {
      inicio: inicio_hhmm,
      termino: termino_hhmm
    }
  end

  def mostrar_titulo_en_calendario?
    titulo_en_calendario? && !titulo.nil? && !titulo.empty?
  end

  def mostrar_participantes_en_calendario?
    participantes_en_calendario? && participantes.any?
  end

  def mostrar_texto_calendario?
   texto_en_calendario && !texto_calendario.nil? && !texto_calendario.empty?
  end

  def show_details_in_calendar?
    details.nil?
  end

  def tags_for_select
    Etiqueta.all.map { |x| [x.nombre, x.id, etiquetas.exists?(x.id)] }
  end

  def participantes_for_select
    Participante.all.map { |x| [x.nombre, x.id, participantes.exists?(x.id)] }
  end

end
