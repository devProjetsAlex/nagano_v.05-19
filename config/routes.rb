Rails.application.routes.draw do
  root 'welcome#index'
  resources :reservations
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
end
