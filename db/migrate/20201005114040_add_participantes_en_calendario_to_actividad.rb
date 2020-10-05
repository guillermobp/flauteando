class AddParticipantesEnCalendarioToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :participantes_en_calendario, :bool, null: false, default: true
  end
end
