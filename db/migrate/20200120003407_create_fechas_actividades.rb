class CreateFechasActividades < ActiveRecord::Migration[6.0]
  def change
    create_table :fechas_actividades do |t|
      t.references :fecha, null: false, foreign_key: true
      t.string :lugar
      t.string :tematica
    end
  end
end
