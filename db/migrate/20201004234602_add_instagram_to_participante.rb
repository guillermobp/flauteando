class AddInstagramToParticipante < ActiveRecord::Migration[6.0]
  def change
    add_column :participantes, :instagram, :string
  end
end
