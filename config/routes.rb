Rails.application.routes.draw do
  root to: "sessions#new"

  get "signup", to: "users#new", as: :signup
  get "login", to: "sessions#new", as: :login
  get "logout", to: "sessions#destroy", as: :logout
  get "home", to: "home#index", as: :home

  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :airplanes
  resources :flights
  resources :bookings do
    collection do
      get :confirmation
      post :book
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
