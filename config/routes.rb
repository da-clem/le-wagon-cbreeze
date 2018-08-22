Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:update] do
    collection do
      get 'settings', to: "users#settings"
      patch 'change', to: "users#change"
    end
    #resources :sessions, only: [:create, :destroy, :index]
  end
  resources :spots, only: [:index]
  resources :favorite_spots, only: [:create, :destroy]
  resources :forecasts, only: [:index]
  #resources :sessions, only: [:create, :destroy, :index]
  get 'mysessions', to: 'sessions#index', as: :mysessions
  post 'mysessions/:id', to: 'sessions#create', as: :mysessions_create
  delete 'mysessions/:id', to: 'sessions#destroy', as: :mysessions_destroy
  get 'mysessions/callback', to: 'sessions#callback', as: :callback
  get 'calendars', to: 'sessions#calendars', as: :calendars

end
