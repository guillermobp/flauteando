class RemoveFechaFromActividad < ActiveRecord::Migration[6.0]
  def change
    remove_column :actividades, :fecha, :date
  end
end
