Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'home#index'
  resources :recipes do
    put :favorite, on: :member
  end
  resources :users, only: [:show]
  resources :kitchens, only: [:new, :create, :show]
  resources :food_types, only: [:new, :create, :show]
  resources :preferences, only: [:new, :create, :show]
end
