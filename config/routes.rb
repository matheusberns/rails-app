Rails.application.routes.draw do
  resources :coins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/inicio", to: 'welcome#index'
end
