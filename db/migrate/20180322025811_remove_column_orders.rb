class RemoveColumnOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :vendor, :string
  end
end
