class Actividad < ApplicationRecord
  belongs_to :fecha_actividad
  has_one :fecha, through: :fecha_actividad
  has_one :version, through: :fecha
end
