Rails.application.routes.draw do
  get "/", to: "welcome#index"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"

  get "/register", to: "users#new"
  post "/register", to: "users#create"

  get "/dashboard", to: "users#show"
end
