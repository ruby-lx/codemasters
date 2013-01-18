Codemasters::Application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]

  get "home/index"
  root to: "home#index"
end
