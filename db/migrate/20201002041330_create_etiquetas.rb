class CreateEtiquetas < ActiveRecord::Migration[6.0]
  def change
    create_table :etiquetas do |t|
      t.string :nombre, null: false
      t.text :descripcion

      t.timestamps
    end
  end
end
