Rails.application.routes.draw do
  root to: 'plants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :plants do
    resources :cart_plants, only: [:create, :update, :destroy]
  end
  resources :carts, only: [:show, :update]
end
