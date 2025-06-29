Rails.application.routes.draw do
  root "public#index"
  
  get "terms",   to: "public#terms"
  get "policy",  to: "public#policy"
  get "cookies", to: "public#cookies"

  # Authentication and dashboard routes
  get    'signup',        to: 'users#new'
  post   'signup',        to: 'users#create'
  get    'login',         to: 'sessions#new'
  post   'login',         to: 'sessions#create'
  delete 'logout',        to: 'sessions#destroy'
  get    'dashboard',     to: 'users#dashboard'
  get    'profile/edit',  to: 'users#edit'
  patch  'profile',       to: 'users#update'

  # resources :directories, only: [:create, :edit, :update]

  # This should be last to avoid conflicts with other routes
  get '/:directory', to: 'public#profile', as: :public_profile
end