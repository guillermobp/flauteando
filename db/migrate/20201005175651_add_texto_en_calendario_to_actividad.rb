class AddTextoEnCalendarioToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :texto_en_calendario, :boolean, null: false, default: false
  end
end
