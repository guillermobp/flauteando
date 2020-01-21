class FechaActividad < ApplicationRecord
  belongs_to :fecha
  has_one :version, through: :fecha
  has_many :actividades, dependent: :destroy
end
