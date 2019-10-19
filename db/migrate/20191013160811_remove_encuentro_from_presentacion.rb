class RemoveEncuentroFromPresentacion < ActiveRecord::Migration[6.0]
  def change
    remove_reference :presentaciones, :encuentro, null: false, foreign_key: true
  end
end
