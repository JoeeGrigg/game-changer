Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/sessions", to: "sessions#create"
  get "/:session_code", to: "sessions#show"
  put "/:session_code", to: "sessions#update"
  post "/:session_code/players", to: "sessions#create_player"
  post "/:session_code/start", to: "sessions#start"
  post "/:session_code/next", to: "sessions#next"

  # Defines the root path route ("/")
  root "home#index"
end
