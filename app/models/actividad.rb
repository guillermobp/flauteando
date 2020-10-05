class Actividad < ApplicationRecord
  # belongs_to :fecha_actividad
  # has_one :encuentro, through: :fecha_actividad
  belongs_to :encuentro

  has_many :actividades_etiquetas
  has_many :etiquetas, through: :actividades_etiquetas

  has_many :actividades_participantes
  has_many :participantes, through: :actividades_participantes

  def fecha_day_name
    fecha.strftime('%A')
  end

  def fecha_day_of_month_long
    fecha.strftime('%d de %B')
  end

  def inicio_hhmm
    inicio.nil? ? '' : inicio.strftime('%H:%M')
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

end
