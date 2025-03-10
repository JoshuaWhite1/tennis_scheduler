Rails.application.routes.draw do
  get "players/index"
  get "players/create"
  root "home#index"

  resources :players, only: [:index, :create]
  resources :schedules, only: [:create, :index]
end
