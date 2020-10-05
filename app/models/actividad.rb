class Actividad < ApplicationRecord
  # belongs_to :fecha_actividad
  # has_one :encuentro, through: :fecha_actividad
  belongs_to :encuentro

  has_many :actividades_etiquetas
  has_many :etiquetas, through: :actividades_etiquetas

  has_many :actividades_participantes
  has_many :participantes, through: :actividades_participantes

  def inicio_hhmm
    inicio.nil? ? '' : inicio.strftime('%H:%M')
  end

end
