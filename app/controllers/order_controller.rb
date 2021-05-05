class OrderController < ApplicationController
  def index
    @orders = current_user.orders.all
  end

  def show
    @order = find_order(params[:id])
  end

  private
  def find_order(id)
    # Поиск заказа без исключения при неправильном id
    order = current_user.orders.find_by(id: id)
    if !order
      flash[:alert] = "Wrong order id"
      redirect_to orders_path
      return
    end
    order.order_descriptions
  end
end
