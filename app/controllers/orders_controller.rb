class OrdersController < ApplicationController
  include OrdersHelper

  def index
    puts params
    if  params[:q] && params[:q]!= ""
      @order = Order.new
      @orders = Order.where(status: params[:q])
      @orders = @orders.order("status DESC")
    else
      @order = Order.new
      @orders = Order.where.not(status: "Delivered")
      @orders = @orders.order("status DESC")
    end 
    @hash = Gmaps4rails.build_markers(@orders) do |order, marker|
      marker.lat from_address_to_geo_location(order).latitude
      marker.lng from_address_to_geo_location(order).longitude
      marker.infowindow "Customer: #{Customer.find(order.customer_id).name}, Order status:#{order.status}, Elapsed time (h): #{order.elapsed_time.round(2)}"
    end
  end

  def create
    @order = Order.create(order_params)
    new_data = status_and_time(@order)
    @order.update(status:new_data[0], elapsed_time: new_data[1])
    @orders = Order.all
    @hash = Gmaps4rails.build_markers(@orders) do |order, marker|
      marker.lat from_address_to_geo_location(order).latitude
      marker.lng from_address_to_geo_location(order).longitude
      marker.infowindow "Customer: #{Customer.find(order.customer_id).name}, Order status:#{order.status}, Elapsed time (h): #{order.elapsed_time.round(2)}"
    end
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:vendor_id,:customer_name,:address,:order_number,:tracking_number)
  end
end