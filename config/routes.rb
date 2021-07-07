Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :home

  get "users/sign_in", to: "sessions#new"
  post "users/sign_in", to: "sessions#create"
  get "users/show", to: "users#show"

  get "owners/sign_in", to: "sessions#new"
  post "owners/sign_in", to: "sessions#create"

  get "users/destroy", to: "owners#delete_user"
  delete "users/destroy", to: "users#destroy"

  resources :users
  resources :owners

  delete "logout", to: "sessions#destroy"
end
