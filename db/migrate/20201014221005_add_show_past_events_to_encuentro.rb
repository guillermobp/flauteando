class AddShowPastEventsToEncuentro < ActiveRecord::Migration[6.0]
  def change
    add_column :encuentros, :show_past_events, :bool, null: false, default: true
  end
end
