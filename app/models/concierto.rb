class Concierto < ApplicationRecord
  belongs_to :encuentro
  has_many :presentaciones
  has_many :obras, through: :presentaciones
  has_many :artistas_presentaciones, through: :presentaciones
  has_many :artistas, through: :artistas_presentaciones
end
