Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get "/home", to: "home#index"
  get "/declaration", to: "declaration#index"
  get "/random_movie", to: "home#random_movie"
  resources :preferences
end
