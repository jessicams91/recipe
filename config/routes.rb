Rails.application.routes.draw do
  root 'home#index'
  resources :recipes, only: [:new, :create, :show]
  resources :kitchens, only: [:new, :create, :show]
  resources :food_types, only: [:new, :create, :show]
  resources :preferences, only: [:new, :create, :show]
end
