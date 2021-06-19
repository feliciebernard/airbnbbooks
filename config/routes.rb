Rails.application.routes.draw do

  resources :contacts, only: [:create, :new]
  authenticated :user do
    root 'own_books#index', as: :authenticated_root
  end
  root "static_pages#index"

  get 'static_pages/team'
  get 'static_pages/privacypolicy'
  get '/own_books/:id', to: 'own_books#set_available', as: 'switch_availability'
  get '/own_books/aaaaaa/:id', to: 'own_books#ask_to_borrow_book', as: 'ask_to_borrow_book'
  resources :private_adresses
  resources :cities
  resources :loans
  resources :own_books
  resources :books
  devise_for :users, controllers: { registrations: "users/registrations"  }
  resources :users do
    resources :avatars, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
