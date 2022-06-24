Rails.application.routes.draw do
  get "/", to: "welcome#index"
  get "/login", to: "sessions#new"
  get "/register", to: "users#new"
end
