Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :places
  resources :images
  resources :cities
  resources :states
  resources :countries
  resources :user_regions
  resources :user_roles
  resources :companies
  devise_for :users

  root 'companies#index'
  get 'get_states'=>"states#get_states"
 get 'get_cities'=>"cities#get_cities"
end
