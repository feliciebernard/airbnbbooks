Rails.application.routes.draw do

 get '/search' => 'searches#search', :as => 'search'

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
