Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy'
  get '/', to: 'users#home', as: 'home'

  resources :users, only: [:new, :create, :show]
  resources :desserts
  resources :favorite_desserts, only: [:create]
  
end
