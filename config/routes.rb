Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :home
  get "users/sign_in", to: "sessions#new"
  post "users/sign_in", to: "sessions#create"
  get "owners/sign_in", to: "sessions#new"
  post "owners/sign_in", to: "sessions#create"
  resources :users
  delete "logout", to: "sessions#destroy"
  get "/manage", to: "manage#index"
  get "/manage/show", to: "manage#show"
end
