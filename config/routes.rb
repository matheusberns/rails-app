Rails.application.routes.draw do
  resources :mining_types
  resources :coins
  resources :welcome
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/welcome", to: 'welcome#index'
  get "/coins", to: 'coins#index'
  #get "/mining_types", to: '/mining_types#index'
end
