Rails.application.routes.draw do
  get 'interests/new'
  get 'interests/create'
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :users, except: :index
  resources :donations
  get 'donations/interests', to: 'donations#interests', as: :donation_interests
  resources :categories, only: [:index, :show]
  resources :locations, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
