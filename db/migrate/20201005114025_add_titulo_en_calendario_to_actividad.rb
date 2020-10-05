class AddTituloEnCalendarioToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :titulo_en_calendario, :bool, null: false, default: true
  end
end
