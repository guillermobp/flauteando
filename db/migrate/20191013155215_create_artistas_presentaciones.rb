class CreateArtistasPresentaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :artistas_presentaciones do |t|
      t.references :artista, null: false, foreign_key: true
      t.references :presentacion, null: false, foreign_key: true
      t.text :instrumentos

      t.timestamps
    end
  end
end
