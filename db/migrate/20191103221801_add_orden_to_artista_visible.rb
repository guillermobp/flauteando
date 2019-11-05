class AddOrdenToArtistaVisible < ActiveRecord::Migration[6.0]
  def change
    add_column :artistas_visibles, :orden, :integer, default: 1
  end
end
