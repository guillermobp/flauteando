class AddFechaToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :fecha, :date
  end
end
