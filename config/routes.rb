Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy'
  
  get '/', to: 'users#home', as: 'home'
  get '/desserts/top_ten', to: 'desserts#top_ten', as: 'top_ten_desserts'

  resources :desserts
  resources :favorite_desserts, only: [:create, :update]
  
end
