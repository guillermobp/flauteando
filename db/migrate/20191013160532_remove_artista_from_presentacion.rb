class RemoveArtistaFromPresentacion < ActiveRecord::Migration[6.0]
  def change
    remove_reference :presentaciones, :artista, null: false, foreign_key: true
  end
end
