Rails.application.routes.draw do
  devise_for :users
  root to: 'plants#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plants do
    resources :cart_plants, only: [:create, :update]
  end
  resources :carts, only: [:show, :create, :update] do
    resources :cart_plants, only: [:destroy] do 
      collection do
        delete "delete_all"
      end
    end
    resources :payments, only: [:new]
    get "thanks", to: "carts#thanks"
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'  
end
