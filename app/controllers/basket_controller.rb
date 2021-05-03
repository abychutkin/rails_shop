class BasketController < ApplicationController
  def index
  end

  def add_item
    if id_absent? "You need to pick item first", root_path
      return
    end
    id = params[:id]
    item_to_add = find_item(id)
    if !item_to_add
      return
    # Редирект если пользователь не указывает количество в url или не заполняет форму
    elsif !params.has_key?(:quantity) || params[:quantity].empty?
      flash[:alert] = "You need to specify quantity"
      redirect_back(fallback_location: root_path)
      return
    end
    quantity = params[:quantity]
    user_session[id] = {quantity: quantity, item: item_to_add}
    redirect_to basket_path
  end

  def remove_item
    if id_absent? "You need specify id of an item you want to remove", basket_path
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
    if user_session.any?
      order = current_user.orders.build(amount: user_session.length)
      user_session.each do |_, data|
        item_id = data['item']['id']
        item = find_item(item_id)
        order_description = order.order_descriptions.build(item: item, quantity: data['quantity'])
        order_description.save
        flash[:notice] = "Your order was created"
      end
      order.save
      clear
    else
      flash[:alert] = "Your basket is empty, you can't create order"
      redirect_to basket_path
      return
    end
  end

  private
  def id_absent? message, url
    # Проверяется наличие параметра id в запросе
    if !params.has_key?(:id)
      flash[:alert] = message
      redirect_to url
      return true
    end
    return false
  end
end
