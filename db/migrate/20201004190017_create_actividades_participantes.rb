class CreateActividadesParticipantes < ActiveRecord::Migration[6.0]
  def change
    create_table :actividades_participantes do |t|
      t.references :actividad, null: false, foreign_key: true
      t.references :participante, null: false, foreign_key: true

      t.timestamps
    end
  end
end
