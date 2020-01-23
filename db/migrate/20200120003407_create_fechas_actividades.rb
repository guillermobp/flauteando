class CreateFechasActividades < ActiveRecord::Migration[6.0]
  def change
    create_table :fechas_actividades do |t|
      t.references :encuentro, null: false, foreign_key: true
      t.date :fecha
      t.string :lugar
      t.string :tematica
    end
  end
end
