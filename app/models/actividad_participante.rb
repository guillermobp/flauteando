class ActividadParticipante < ApplicationRecord
  belongs_to :actividad
  belongs_to :participante
end
