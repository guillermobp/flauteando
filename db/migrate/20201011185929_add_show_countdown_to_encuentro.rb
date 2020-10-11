class AddShowCountdownToEncuentro < ActiveRecord::Migration[6.0]
  def change
    add_column :encuentros, :show_countdown, :bool, null: false, default: true
  end
end
