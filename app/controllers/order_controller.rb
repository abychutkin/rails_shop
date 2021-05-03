class OrderController < ApplicationController
  def index
    @orders = current_user.orders.all
  end

  def show
    ###if !params.has_key?(:id)
    ###  flash[:error] = "You need to pick order first"
    ###  redirect_to orders_path
    ###  return
    ###end
    ###@order = current_user.orders.find(params[:id]).order_descriptions
    @order = find_order(params[:id])
  end

  private
  def find_order(id)
    ###item = Item.find_by(id: id)
    order = current_user.orders.find_by(id: id)
    if !order
      flash[:errors] = "Wrong order id"
      redirect_to orders_path
      return
    end
    order.order_descriptions
  end
end
