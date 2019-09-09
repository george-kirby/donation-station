Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create', as: :create_session
  get 'logout', to: 'sessions#destroy', as: :logout
  get 'register', to: 'users#new', as: :register
  get 'users/home', to: 'users#home', as: :user_home
  resources :users, except: [:index, :new]
  resources :donations
  get 'donations/interests', to: 'donations#interests', as: :donation_interests
  resources :categories, only: [:index, :show]
  resources :locations, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
