class AddOrderToSlide < ActiveRecord::Migration[6.0]
  def change
    add_column :slides, :order, :int, null: false, default: 0
  end
end
