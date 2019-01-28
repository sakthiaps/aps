Rails.application.routes.draw do
  root to: "home#index"

  get "signup", to: "users#new", as: :signup
  get "login", to: "sessions#new", as: :login
  get "logout", to: "sessions#destroy", as: :logout

  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :airplanes
  resources :flights
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
