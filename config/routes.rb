Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  get "users", to: "users#index"
  get "users/sign_up", to: "users#new"
  post "users/sign_up", to: "users#create"
end
