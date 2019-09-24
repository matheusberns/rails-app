Rails.application.routes.draw do
  root 'messages#new'
  post 'messages/messages', to: 'messages#create'

  get 'messages/new'
  get 'messages/create'
  get 'control_users/index'
  devise_for :users
  resources :logins
  resources :users
  resources :mining_types
  resources :coins
  resources :welcome
  resources :control_users
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: 'welcome#index'
  get "/coins", to: 'coins#index'
end
