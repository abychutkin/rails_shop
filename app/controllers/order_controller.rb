class OrderController < ApplicationController
  def index
    @orders = current_user.orders.all
  end

  def show
    if !params.has_key?(:id)
      flash[:error] = "You need to pick order first"
      redirect_to orders_path
      return
    end
    @order = Order.find(params[:id])
  end
end
