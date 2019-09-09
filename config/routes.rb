Rails.application.routes.draw do
  root 'donations#index'
  resources :users, except: :index
  get 'login', to: 'users#login', as: :login # could be session#login
  resources :donations
  get 'donations/interests', to: 'donations#interests', as: :donation_interests
  resources :categories, only: [:index, :show]
  resources :locations, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
