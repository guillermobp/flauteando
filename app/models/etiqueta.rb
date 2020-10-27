class Etiqueta < ApplicationRecord
  has_many :actividades_etiquetas
  has_many :actividades, through: :actividades_etiquetas

  def Etiqueta.for_select
    all.map { |x| [x.nombre, x.id] }
  end

  def activities_by_start_date
    etiqueta.actividades.group_by{ |a| a.inicio.beginning_of_day }
  end
end
