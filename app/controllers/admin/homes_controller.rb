class Admin::HomesController < ApplicationController

  def top
    @admins_orders = Order.all
  end

end
