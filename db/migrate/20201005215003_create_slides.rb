class CreateSlides < ActiveRecord::Migration[6.0]
  def change
    create_table :slides do |t|
      t.string :title
      t.text :description
      t.references :encuentro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
