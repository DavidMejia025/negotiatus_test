class OrdersController < ApplicationController
  def index
    @order = Order.new
    @orders = Order.all.order("order_number ASC")
  end

  def create
  end

  def update 
  end

  def destroy
  end
end
