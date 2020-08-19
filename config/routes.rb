Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new'
  resources :sessions, only: [:create]
  get '/logout', to: 'sessions#destroy'
  
  get '/', to: 'users#home', as: 'home'
  get '/desserts/top_ten', to: 'desserts#top_ten', as: 'top_ten_desserts'
  get '/meals/top_ten', to: 'meals#top_ten', as: 'top_ten_meals'
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :desserts
  resources :meals
  resources :favorite_desserts, only: [:create, :update]
  
end
