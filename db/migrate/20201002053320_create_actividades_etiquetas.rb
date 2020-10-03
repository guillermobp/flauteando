class CreateActividadesEtiquetas < ActiveRecord::Migration[6.0]
  def change
    create_table :actividades_etiquetas do |t|
      t.references :actividad, null: false, foreign_key: true
      t.references :etiqueta, null: false, foreign_key: true

      t.timestamps
    end
  end
end
