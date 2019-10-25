class Presentacion < ApplicationRecord
  belongs_to :concierto

  has_one :encuentro, through: :concierto

  has_many :obras_presentaciones, dependent: :destroy
  has_many :artistas_presentaciones, dependent: :destroy

  has_many :obras, through: :obras_presentaciones
  has_many :artistas, through: :artistas_presentaciones

  def obras_for_select
    Obra.all.map { |x| [x.titulo, x.id, obras.exists?(x.id)] }
  end

  def artistas_for_select
    Artista.all.map { |x| [x.nombre, x.id, artistas.exists?(x.id)] }
  end
end
