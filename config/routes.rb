Rails.application.routes.draw do
  resources :customers, only: [:show]
  resources :supermarkets, only: [:show]

  get '/supermarkets/:id/items', to: 'items#index'
end
