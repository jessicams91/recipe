Rails.application.routes.draw do
  root 'home#index'
  resources :recipes, only: [:new, :create, :show]
  resources :kitchens, only: [:new, :create, :show]
end
