class CreateParticipantes < ActiveRecord::Migration[6.0]
  def change
    create_table :participantes do |t|
      t.string :nombre
      t.text :bio

      t.timestamps
    end
  end
end
