Rails.application.routes.draw do
  root to: 'pages#home'
  get 'donations/search_results', to: 'donations#search_results', as: :search_results
  get 'donations/search_by_location/', to: 'donations#search_by_location'
  get 'about', to: 'pages#about'
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create', as: :create_session
  get 'logout', to: 'sessions#destroy', as: :logout
  get 'register', to: 'users#new', as: :register
  get 'user/my-donations', to: 'donations#current_user_donations', as: :my_donations
  get 'user/my-interests', to: 'donations#current_user_interests', as: :my_interests
  resources :users, only: [:show, :create, :update]
  get 'user/delete-confirmation', to: 'users#confirm_account_deletion', as: :delete_confirmation
  get 'user/delete', to: 'users#destroy', as: :delete_user
  get 'user/edit', to: 'users#edit', as: :edit_user
  resources :donations
  resources :interests, only: [:new, :create, :index]
  post 'interest/remove', to: 'interests#delete', as: :remove_interest
  
  get 'donations/interests', to: 'donations#interests', as: :donation_interests
  resources :categories, only: [:index, :show]
  resources :locations, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
