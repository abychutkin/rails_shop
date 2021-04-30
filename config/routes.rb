Rails.application.routes.draw do
  get 'basket', to: 'basket#index'
  get 'basket/add_item(/:id)', to: 'basket#add_item', constraints: {id: /\d+/, quantity: /\d+/}
  get 'basket/remove_item(/:id)', as: 'remove_item', to: 'basket#remove_item', constraints: {id: /\d+/, quantity: /\d+/}
  get 'basket/clear'
  get 'basket/pay'
  resources :items
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
