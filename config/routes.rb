Rails.application.routes.draw do

  get 'home/index'
 get '/search' => 'own_books#search', :as => 'search_own_book'

  resources :contacts, only: [:create, :new]
  authenticated :user do
    root 'own_books#index', as: :authenticated_root
  end
  root "static_pages#index"

  get 'static_pages/team'
  get 'static_pages/privacypolicy'
  #get '/own_books/:id', to: 'own_books#set_available', as: 'switch_availability'
  resources :private_addresses
  resources :cities
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :own_books do
    patch :set_available
    resources :loans
  end

  resources :loans, only: [:patch] do 
    patch :make_it_past
  end





  resources :books
  devise_for :users, controllers: { registrations: "users/registrations"  }
  resources :users do
    resources :avatars, only: [:create]
  end

end
