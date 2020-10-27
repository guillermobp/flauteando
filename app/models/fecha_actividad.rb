class FechaActividad < ApplicationRecord
  belongs_to :encuentro
  has_many :actividades, dependent: :destroy

  def fecha_ddmmyyyy
    inicio.nil? ? '' : inicio.strftime('%d/%m/%Y')
  end
end
