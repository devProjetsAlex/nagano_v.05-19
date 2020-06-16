Rails.application.routes.draw do
  root 'rooms#index'
  
  resources :reservations
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to:'sessions#new'
  post 'login',to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :rooms
end
