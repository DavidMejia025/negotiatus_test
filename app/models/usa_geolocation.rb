class UsaGeolocation < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  def distance(vendor_address,customer_addres)
    vendor_address = Geocoder.coordinates(join_address(vendor_address))
    customer_address = Geocoder.coordinates(join_address(customer_address))
    Geocoder::Calculations.distance_between(vendor_address,customer_address)
end
end
