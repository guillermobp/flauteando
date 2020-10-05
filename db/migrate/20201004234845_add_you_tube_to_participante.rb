class AddYouTubeToParticipante < ActiveRecord::Migration[6.0]
  def change
    add_column :participantes, :youtube, :string
  end
end
