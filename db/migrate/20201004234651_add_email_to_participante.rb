class AddEmailToParticipante < ActiveRecord::Migration[6.0]
  def change
    add_column :participantes, :email, :string
  end
end
