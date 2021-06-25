Rails.application.routes.draw do

  resources :contacts, only: [:create, :new]
  authenticated :user do
    root 'own_books#index', as: :authenticated_root
  end
  root "static_pages#index"
  get 'static_pages/team'
  get 'static_pages/privacypolicy'
  get '/search' => 'own_books#search', :as => 'search_own_book'

  resources :private_addresses
  resources :cities

  resources :own_books do
    patch :set_available
    resources :loans
  end
  resources :books
  devise_for :users, controllers: { registrations: "users/registrations"  }
  resources :users do
    resources :avatars, only: [:create]
  end

end
