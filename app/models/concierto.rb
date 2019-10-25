class Concierto < ApplicationRecord
  belongs_to :encuentro

  has_many :presentaciones

  has_many :artistas, -> { distinct }, through: :presentaciones
  has_many :obras, -> { distinct }, through: :presentaciones

  def display_short_date
    fecha.strftime('%d/%m/%Y')
  end

  def display_short_time
    hora.strftime('%H:%M')
  end
end
