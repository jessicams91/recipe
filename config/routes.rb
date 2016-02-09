Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :recipes
  resources :kitchens, only: [:new, :create, :show]
  resources :food_types, only: [:new, :create, :show]
  resources :preferences, only: [:new, :create, :show]
end
