class OrdersController < ApplicationController
  include OrdersHelper

  def index
    

    @order = Order.new
    @orders = Order.where.not(status: "Delivered")
    @orders = @orders.order("order_number ASC")

    puts "!!!!!!!!!!!!!!!!!!!1"
    puts num()
    join_address(Vendor.second.address)

     
  end

  def show

  end
  def create
  end

  def update 
  end

  def destroy
  end

  def join_address(address)
    puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11"
    p address
  end
end
