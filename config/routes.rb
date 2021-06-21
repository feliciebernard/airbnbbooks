Rails.application.routes.draw do

  resources :contacts, only: [:create, :new]
  authenticated :user do
    root 'own_books#index', as: :authenticated_root
  end
  root "static_pages#index"

  get 'static_pages/team'
  get 'static_pages/privacypolicy'
  get '/own_books/:id', to: 'own_books#set_available', as: 'switch_availability'
  resources :private_adresses
  resources :cities

  resources :own_books do
    resources :loans, only: [:create, :destroy]
  end
  resources :loans, except: [:create, :destroy]

  resources :books
  devise_for :users, controllers: { registrations: "users/registrations"  }
  resources :users do
    resources :avatars, only: [:create]
  end

end
