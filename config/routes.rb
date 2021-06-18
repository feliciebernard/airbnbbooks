Rails.application.routes.draw do

  resources :contacts, only: [:create, :new]
  authenticated :user do
    root 'own_books#index', as: :authenticated_root
  end
  root "static_pages#index"

  get 'static_pages/team'
  get 'static_pages/privacypolicy'
  resources :private_adresses
  resources :cities
  resources :loans
  resources :own_books
  resources :books
  devise_for :users
  resources :users do
    resources :avatars, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
