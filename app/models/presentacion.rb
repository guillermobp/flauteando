class Presentacion < ApplicationRecord
  belongs_to :concierto
  has_many :obras_presentaciones
  has_many :artistas_presentaciones
  has_many :obras, through: :obras_presentaciones
  has_many :artistas, through: :artistas_presentaciones
end
