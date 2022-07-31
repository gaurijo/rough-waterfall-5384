Rails.application.routes.draw do
  resources :customers, only: [:show]
  resources :supermarkets, only: [:show]
end
