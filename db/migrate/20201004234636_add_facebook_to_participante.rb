class AddFacebookToParticipante < ActiveRecord::Migration[6.0]
  def change
    add_column :participantes, :facebook, :string
  end
end
