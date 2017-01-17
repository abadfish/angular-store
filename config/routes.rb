Rails.application.routes.draw do
  resources :users
  resources :line_items
  resources :carts
  resources :categories
  resources :items

  root 'application#index'
end
