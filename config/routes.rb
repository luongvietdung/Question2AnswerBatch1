Rails.application.routes.draw do

  get "users/new"
  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete  "/logout",  to: "sessions#destroy"
  root "static_page#index"

  resources :questions do
    member do
      put :like, to: "questions#up"
      put :dislike, to: "questions#down"
    end
  end
  resources :users
  resources :account_activations, only: [:edit]
end
