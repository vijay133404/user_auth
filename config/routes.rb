Rails.application.routes.draw do
  resources :places
  resources :images
  resources :cities
  resources :states
  resources :countries
  resources :user_regions
  resources :user_roles
  resources :companies
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
