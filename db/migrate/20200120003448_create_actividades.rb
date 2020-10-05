class CreateActividades < ActiveRecord::Migration[6.0]
  def change
    create_table :actividades do |t|
      # t.references :fecha_actividad, null: false, foreign_key: true
      t.references :encuentro, null: false, foreign_key: true
      t.datetime :inicio
      t.datetime :termino
      t.string :titulo
      t.string :descripcion
      t.string :lugar
    end
  end
end
