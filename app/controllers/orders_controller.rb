class OrdersController < ApplicationController
  include OrdersHelper

  def index
    @order = Order.new
    @orders = Order.where.not(status: "Delivered")
    @orders = @orders.order("order_number ASC")
    puts @orders.all 
    @orders.all
  end

  def show

  end
  def create
    @order = Order.create(order_params)
    new_data = status_and_time(@order)
    @order.update(status:new_data[0], elapsed_time: new_data[1])
    @orders = Order.all
    respond_to do |format|
      format.js
    end


  end

  def update 
  end

  def destroy
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:vendor_id,:customer_name,:shipping_address,:order_number,:tracking_number)
  end
end