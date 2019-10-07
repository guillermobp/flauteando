class CreatePresentaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :presentaciones do |t|
      t.references :encuentro, null: false, foreign_key: true
      t.references :artista, null: false, foreign_key: true

      t.timestamps
    end
  end
end
