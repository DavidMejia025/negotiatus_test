class OrdersController < ApplicationController
  def index
    @order = Order.new
    @orders = Order.where.not(status: "Delivered")
    @orders = @orders.order("order_number ASC")
     
  end

  def show

  end
  def create
  end

  def update 
  end

  def destroy
  end
end
