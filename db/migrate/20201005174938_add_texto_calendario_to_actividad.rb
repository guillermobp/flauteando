class AddTextoCalendarioToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :texto_calendario, :text
  end
end
