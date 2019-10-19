class CreateConciertos < ActiveRecord::Migration[6.0]
  def change
    create_table :conciertos do |t|
      t.date :fecha
      t.time :hora
      t.string :lugar
      t.references :encuentro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
