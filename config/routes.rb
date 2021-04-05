Rails.application.routes.draw do
  devise_for :users
  root to: 'plants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :cart_plants, only: [:create, :update]
  end
  resources :carts, only: [:show, :update] do
    resources :cart_plants, only: [:destroy]
    resources :orders, only: [:show, :create] do
      resources :payments, only: :new
    end
  end
  
end
