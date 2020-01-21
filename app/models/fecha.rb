class Fecha < ApplicationRecord
  belongs_to :encuentro
  has_many :fechas_actividades, dependent: :destroy
  has_many :actividades, through: :fechas_actividades
end
