class CreateArtistas < ActiveRecord::Migration[6.0]
  def change
    create_table :artistas do |t|
      t.string :nombre
      t.text :bio

      t.timestamps
    end
  end
end
