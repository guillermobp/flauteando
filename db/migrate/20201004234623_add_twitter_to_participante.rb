class AddTwitterToParticipante < ActiveRecord::Migration[6.0]
  def change
    add_column :participantes, :twitter, :string
  end
end
