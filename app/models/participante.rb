class Participante < ApplicationRecord

  default_scope { order(:nombre) }

  has_many :actividades_participantes
  has_many :actividades, through: :actividades_participantes

  has_one_attached :foto

  def Participante.for_select
    all.map { |x| [x.nombre, x.id] }
  end

  def foto_display

    if !foto.attached?
      return 'http://dummyimage.com/800x600/ccc/fff.png'
    end

    foto
  end

end
