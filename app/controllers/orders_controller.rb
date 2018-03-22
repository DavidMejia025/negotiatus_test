class OrdersController < ApplicationController
  def index
    

    @order = Order.new
    @orders = Order.where.not(status: "Delivered")
    @orders = @orders.order("order_number ASC")
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
