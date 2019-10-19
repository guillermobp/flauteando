class CreateObrasPresentaciones < ActiveRecord::Migration[6.0]
  def change
    create_table :obras_presentaciones do |t|
      t.references :obra, null: false, foreign_key: true
      t.references :presentacion, null: false, foreign_key: true
      t.integer :orden

      t.timestamps
    end
  end
end
