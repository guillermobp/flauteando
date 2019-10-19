class CreateArtistasVisibles < ActiveRecord::Migration[6.0]
  def change
    create_table :artistas_visibles do |t|
      t.references :artista, null: false, foreign_key: true
      t.references :encuentro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
