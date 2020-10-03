class Actividad < ApplicationRecord
  belongs_to :fecha_actividad
  has_one :encuentro, through: :fecha_actividad
  has_many :actividades_etiquetas
  has_many :etiquetas, through: :actividades_etiquetas

  def inicio_hhmm
    inicio.nil? ? '' : inicio.strftime('%H:%M')
  end

end
