module OrdersHelper
def create_address
  state = CS.states(:us).keys.sample;
  city = CS.cities(state,:us).sample;  
end

def from_address_to_geo_location(place)
  while (place.latitude==nil) || (place.longitude==nil)
    address = Geocoder.coordinates(place.address)
    unless address == nil
        place.update(latitude: address[0])
        place.update(longitude: address[1])
    end
  end
  place
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
    customer_address = [Customer.find(order.customer_id).latitude, Customer.find(order.customer_id).longitude]
    vendor_address = [Vendor.find(order.vendor_id).latitude, Vendor.find(order.vendor_id).longitude]
    average_time = calculate_distance(customer_address, vendor_address)/70
    elapsed_time = average_time+(-4*rand(average_time)+(average_time))
    [calculate_status(average_time, elapsed_time), elapsed_time]
  end
end
