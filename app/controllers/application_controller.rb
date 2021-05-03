class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end

    def find_item(id)
      item = Item.find_by(id: id)
      if !item
        flash[:errors] = "Wrong item id"
        redirect_to root_path
        return
      end
      item
    end
  end