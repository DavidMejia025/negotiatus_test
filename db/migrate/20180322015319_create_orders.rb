class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :vendor, index: true
      t.belongs_to :customer, index:true
      t.integer :order_number
      t.string :vendor
      t.integer :tracking_number
      t.string :shipping_address
      t.string :status
      t.timestamps null: false
    end
  end
end
