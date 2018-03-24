# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  vendor_id        :integer
#  customer_id      :integer
#  order_number     :integer
#  tracking_number  :integer
#  shipping_address :string
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  vendor_name      :string
#  elapsed_time     :decimal(, )
#
include OrdersHelper

class Order < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :customer

end
