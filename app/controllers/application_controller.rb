class ApplicationController < ActionController::Base
    before_action  :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    
    def configure_permitted_parameters
      # Добавление в строгие параметры devise полей форм first_name и last_name
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end

    def find_item(id)
      # Поиск товара без исключения при неправильном id
      item = Item.find_by(id: id)
      if !item
        flash[:alert] = "Wrong item id"
        redirect_to root_path
        return
      end
      item
    end
  end