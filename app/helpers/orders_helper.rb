module OrdersHelper
def create_address
  state = CS.states(:us).keys.sample;
  city = CS.cities(state,:us).sample;  
  geo_address = from_address_to_geo_location(city)
  address = from_geolocation_to_address(geo_address)
end

def from_address_to_geo_location(address)
  geo_address = Geocoder.coordinates(address)
  while geo_address == nil
    geo_address = Geocoder.coordinates(address)
  end
  #geo_address = [geo_address[0].to_i+rand(5),geo_address[0].to_i+rand(5)]
  geo_address
end

def from_geolocation_to_address(coordinates)
  address = Geocoder.search(coordinates)
  unless address.first.nil?
    address = address.first.address
    3.times do
      address.slice!(",")
    end
    address
  else 
    create_address
  end
end

def calculate_distance(address1,address2)
    distance = Geocoder::Calculations.distance_between(address1, address2)
end

def calculate_status(average_time, elapsed_time)
    if elapsed_time < 0
      "Delivered"
      elsif elapsed_time <= average_time
        "Normal"
        elsif ((elapsed_time > average_time) && (elapsed_time < 3*average_time.div(2)))
          "Not normal" 
        else
          "Very late"
    end        
end

def status_and_time(order)
    customer_address = from_address_to_geo_location(order.shipping_address)
    vendor_address = from_address_to_geo_location(Vendor.find(order.vendor_id).address)
    average_time = calculate_distance(customer_address, vendor_address)/70
    elapsed_time = average_time+(2*rand(average_time)-(6*average_time.div(4)))
    [calculate_status(average_time, elapsed_time), elapsed_time]
  end
end
