class AddShowInstagramFeedToEncuentro < ActiveRecord::Migration[6.0]
  def change
    add_column :encuentros, :show_instagram_feed, :bool, null: false, default: true
  end
end
