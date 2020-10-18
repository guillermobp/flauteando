class AddShowDescriptionInCalendarToActividad < ActiveRecord::Migration[6.0]
  def change
    add_column :actividades, :show_description_in_calendar, :boolean, nil: false, default: false
  end
end
