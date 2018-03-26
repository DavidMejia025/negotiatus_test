# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

Vendor.destroy_all
Customer.destroy_all
Order.destroy_all
include OrdersHelper
vendors = []
customers = []
3.times do
  Vendor.create(name:Faker::Company.name,address:create_address)
  if(Vendor.last.latitude==nil) || (Vendor.last.longitude==nil)
    from_address_to_geo_location(Vendor.last)
  end
  puts Vendor.count
end
 low_vendor_id = Vendor.first.id
 high_vendor_id = Vendor.last.id

3.times do
  Customer.create(name:Faker::Company.name,address:create_address)
  if(Customer.last.latitude==nil) || (Customer.last.longitude==nil)
    from_address_to_geo_location(Customer.last)
  end
  puts Customer.count
end
 low_customer_id = Customer.first.id
 high_customer_id = Customer.last.id

3.times do
  vendor_i = Vendor.find(rand(low_vendor_id..high_vendor_id))
  vendor_address = [vendor_i.latitude, vendor_i.longitude]
  customer_i = Customer.find(rand(low_customer_id..high_customer_id))
  customer_address = [customer_i.latitude, customer_i.longitude]
  average_time = calculate_distance(vendor_address,customer_address)/70 
  elapsed_time = average_time+(2*rand(average_time)-(7*average_time.div(4)))
  order_status = calculate_status(average_time,elapsed_time)
  order_number = rand(999)
  tracking_number = order_number.to_s+5.times.map{rand(10)}.join
  
  Order.create(vendor_id:vendor_i.id,customer_id:customer_i.id,order_number:order_number,tracking_number:tracking_number,address:customer_i.address,status:order_status,vendor_name:vendor_i.name,elapsed_time:elapsed_time)

end

