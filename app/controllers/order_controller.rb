class OrderController < ApplicationController
  def index
    @orders = current_user.orders.all
  end

  def show
  end
end
