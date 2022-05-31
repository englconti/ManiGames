Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :games
  resources :users, only: %i[show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :rents, only: %i[edit update new create show]
end
