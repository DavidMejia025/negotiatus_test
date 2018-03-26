class RenameShippingAddress < ActiveRecord::Migration
  def change
    rename_column :orders, :shipping_address, :address
  end
end
