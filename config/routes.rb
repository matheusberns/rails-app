Rails.application.routes.draw do
  get 'control_users/index'
  get 'users/sign_in'
  devise_for :users
  resources :logins
  resources :users
  resources :mining_types
  resources :coins
  resources :welcome
  resources :control_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'welcome#index'
  get "/coins", to: 'coins#index'
  #get "/mining_types", to: '/mining_types#index'
end
