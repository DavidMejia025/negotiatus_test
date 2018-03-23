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
#

class Order < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :customer

  def travel_time()
    vendor_address = self.vendor.address
    customer_address =  self.customer.address
  end

  def from_address_to_geo_location(address)
      address = GeoCoder.coordinate()
      address = [address[0]+rand(5),address[0]+rand(5)]
  end

  def from_geolocation_to_address(coordinates)
    Geocoder.search(coordinates).first.address
  end

  def calculate_distance(address1,address2)
    Geocoder::Calculations.distance_between(address1, address2)
  end
end
