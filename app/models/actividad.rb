class Actividad < ApplicationRecord
  belongs_to :fecha_actividad
  has_one :encuentro, through: :fecha_actividad

  def inicio_hhmm
    inicio.nil? ? '' : inicio.strftime('%H:%M')
  end

end
