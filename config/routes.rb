Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :update] do
    resources :sessions, only: [:create, :destroy, :index]
  end
  resources :spots, only: [:index]
  resources :favorite_spots, only: [:create, :destroy]
  resources :forecasts, only: [:index]
  #resources :sessions, only: [:create, :destroy, :index]
end
