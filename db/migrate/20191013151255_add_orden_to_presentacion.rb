class AddOrdenToPresentacion < ActiveRecord::Migration[6.0]
  def change
    add_column :presentaciones, :orden, :integer
  end
end
