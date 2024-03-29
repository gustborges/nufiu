Rails.application.routes.draw do
  # Sidekiq Web UI, only for admins
  require 'sidekiq/web'
  authenticate :user, ->(u) { u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get 'users/edit'
  get 'users/update'
  scope(path_names: { new: 'novo', edit: 'editar' }) do
    devise_for :users, controllers: { registrations: 'registrations' }

    root to: 'plants#index'

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get 'sobre', to: 'pages#about'
    get 'privacidade', to: 'pages#privacy'
    get 'faq', to: 'pages#faq'
    get 'entregas', to: 'pages#delivery'
    get 'workshop', to: 'pages#workshop'
    get 'pagamento', to: 'pages#payment'
    get '/robots.txt', to: 'pages#robots'
    resources :contacts, path: 'contato', only: %i[index show new create]
    resources :shippings, only: %i[create update]
    resources :plants, path: 'kokedamas' do
      patch :edit_published, on: :member
      resources :cart_plants, only: %i[create update]
    end
    resources :carts, path: 'compras', only: %i[show create update] do
      resources :cart_plants, only: [:destroy] do
        collection { delete 'delete_all' }
      end
      resources :payments, path: 'pagar', only: :new
      get 'obrigada', to: 'carts#thanks'
    end
    mount StripeEvent::Engine, at: '/stripe-webhooks'
  end
end
