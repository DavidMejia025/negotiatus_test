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

def create_address
  state = CS.states(:us).keys.sample;
  city = CS.cities(state,:us).sample;
  
  geo_address = from_address_to_geo_location(city)
  address = from_geolocation_to_address(geo_address)
end

def from_address_to_geo_location(address)
  geo_address = nil
  while geo_address == nil
    geo_address = Geocoder.coordinates(address)
  end
  geo_address
  #geo_address = [geo_address[0].to_i+rand(5),geo_address[0].to_i+rand(5)]

end

def from_geolocation_to_address(coordinates)
  address = Geocoder.search(coordinates)
  puts "!!!!!!!!!!!"
  p address.length
  puts "$$$$$$$$$$$$$"
  if address == [] || address == nil
    create_address
  end
  address.first.address
end


10.times do
  Vendor.create(name:Faker::Company.name,address:create_address)
end
 low_vendor_id = Vendor.first.id
 high_vendor_id = Vendor.last.id

10.times do
  Customer.create(name:Faker::Company.name,address:create_address)
end
 low_customer_id = Customer.first.id
 high_customer_id = Customer.last.id


3.times do
  vendor_i = Vendor.find(rand(low_vendor_id..high_vendor_id))
  customer_i = Customer.find(rand(low_customer_id..high_customer_id))
  order_number = rand(999)
  tracking_number = order_number.to_s+5.times.map{rand(10)}.join
  Order.create(vendor_id:vendor_i.id,customer_id:customer_i.id,order_number:order_number,tracking_number:tracking_number,shipping_address:customer_i.address,status:"Ready to dispatch",vendor_name:vendor_i.name)
end

