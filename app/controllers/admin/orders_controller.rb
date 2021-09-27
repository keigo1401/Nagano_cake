class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[])
  end

  def update
  end

end
