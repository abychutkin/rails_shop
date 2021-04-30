class BasketController < ApplicationController
  def index
  end

  def add_item
    # Редирект, если пользователь просто заходит на add_item, не добавляя товар
    if !params.has_key?(:id)
      flash[:error] = "You need to pick item first"
      redirect_to root_path
      return
    # Редирект если пользователь не указывает количество в url или не заполняет форму
    elsif !params.has_key?(:quantity) || params[:quantity].empty?
      flash[:error] = "You need to specify quantity"
      redirect_back(fallback_location: root_path)
      return
    end
    id = params[:id]
    quantity = params[:quantity]
    user_session[id] = {quantity: quantity, item: Item.find(id)}
    redirect_to basket_path
  end

  def remove_item
    if !params.has_key?(:id)
      flash[:error] = "You need specify id of an item you want to remove"
      redirect_to basket_path
      return
    end
    user_session.delete(params[:id])
    redirect_to basket_path
  end

  def clear
    user_session.clear
    redirect_to basket_path
  end

  def pay
  end
end
