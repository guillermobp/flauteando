class CreateEncuentros < ActiveRecord::Migration[6.0]
  def change
    create_table :encuentros do |t|
      t.integer :version
      t.string :titulo
      t.string :epigrafe
      t.string :bajada
      t.string :mision
      t.string :vision
      t.boolean :habilitado

      t.timestamps
    end
  end
end
