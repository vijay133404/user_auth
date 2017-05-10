Rails.application.routes.draw do
  resources :regions
  resources :nodes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :places
  resources :images
  resources :cities do
    collection do
      get :get_cities
    end
  end

  resources :states do
    collection do
      get :get_states
    end
  end
  resources :countries
  resources :user_regions
  resources :user_roles
  resources :companies
  resources :manages
  devise_for :users

  root 'companies#index'
  

end
