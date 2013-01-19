Codemasters::Application.routes.draw do
  get "skills_users/destroy"

  get "skills/destroy"

  devise_for :users
  resources :users, only: [:index, :show] do
    resources :skills, controller: 'SkillsUsers', only: [:destroy]
  end

  root to: "users#index"
end
