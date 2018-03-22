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

10.times do
  Vendor.create(name:Faker::Company.name,address:[Faker::Address.street_address,Faker::Address.city,Faker::Address.state])
end
 low_vendor_id = Vendor.first.id
 high_vendor_id = Vendor.last.id

10.times do
  Customer.create(name:Faker::Company.name,address:[Faker::Address.street_address,Faker::Address.city,Faker::Address.state])
end
 low_customer_id = Customer.first.id
 high_customer_id = Customer.last.id



30.times do
  vendor_i = Vendor.find(rand(low_vendor_id..high_vendor_id))
  customer_i = Customer.find(rand(low_customer_id..high_customer_id))
  order_number = rand(999)
  tracking_number = order_number.to_s+5.times.map{rand(10)}.join
  Order.create(vendor_id:vendor_i.id,customer_id:customer_i.id,order_number:order_number,tracking_number:tracking_number,shipping_address:customer_i.address,status:"Ready to dispatch",vendor_name:vendor_i.name)
end

