class Etiqueta < ApplicationRecord
  has_many :actividades_etiquetas
  has_many :actividades, through: :actividades_etiquetas

  def Etiqueta.for_select
    all.map { |x| [x.nombre, x.id] }
  end
end
