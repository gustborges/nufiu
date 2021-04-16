Rails.application.routes.draw do
  get 'users/edit'
  get 'users/update'
  scope(path_names: { new: 'novo', edit: 'editar' }) do
    devise_for :users, controllers: { registrations: "registrations" }

    root to: 'plants#index'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get 'sobre', to: 'pages#about'
    get 'privacidade', to: 'pages#privacy'
    get 'faq', to: 'pages#faq'
    get 'entregas', to: 'pages#delivery'
    get 'workshop', to: 'pages#workshop'
    get 'pagamento', to: 'pages#payment'
    resources :contacts, path: 'contato', only: [:index, :show, :new, :create]
    resources :shippings, only: [:create, :update]
    resources :plants, path: 'kokedamas' do
      resources :cart_plants, only: [:create, :update]
    end
    resources :carts, path: 'compras', only: [:show, :create, :update] do
      resources :cart_plants, only: [:destroy] do
        collection do
          delete "delete_all"
        end
      end
      resources :payments, path: 'pagar', only: [:new]
      get "obrigada", to: "carts#thanks"
    end
    mount StripeEvent::Engine, at: '/stripe-webhooks'
  end
end
