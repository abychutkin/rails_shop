class BasketController < ApplicationController
  def index
  end

  def add_item
    id = params[:id]
    quantity = params[:quantity]
    user_session[id] = {quantity: quantity, item: Item.find(id)}
    redirect_to basket_path
  end

  def remove_item
  end

  def clear
  end

  def pay
  end
end
