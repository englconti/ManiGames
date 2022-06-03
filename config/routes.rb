Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: %i[show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :rents, only: %i[edit update show]

  resources :games, except: [:destroy] do
    resources :rents, only: %i[new create]
  end

  resources :users do
    resources :games, except: %i[index show destroy]
  end

  resources :games, only: [:destroy]
  resources :rents, only: [:destroy]
end
