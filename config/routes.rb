Rails.application.routes.draw do

  root 'static_pages#about'

  get 'static_pages/team'
  get 'static_pages/privacypolicy'
  resources :private_adresses
  resources :cities
  resources :loans
  resources :own_books
  resources :books
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
