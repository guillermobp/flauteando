class CreateFechas < ActiveRecord::Migration[6.0]
  def change
    create_table :fechas do |t|
      t.references :encuentro, null: false, foreign_key: true
      t.date :fecha
    end
  end
end
