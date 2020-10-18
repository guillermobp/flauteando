class AddDetailsToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :details, :text
  end
end
