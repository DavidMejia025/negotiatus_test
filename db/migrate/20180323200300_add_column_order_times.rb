class AddColumnOrderTimes < ActiveRecord::Migration
  def change
    add_column :orders, :elapsed_time, :decimal
  end
end
