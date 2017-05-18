Rails.application.routes.draw do
  
  resources :nodes do
    member do
      get :nodes_edit
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :places
  resources :images
  resources :cities do
    collection do
      get :get_cities
    end
     member do
      get :cities_edit
      end
  end
  resources :states do
    collection do
      get :get_states
    end
      member do 
      get :states_edit
    end
   end
  resources :countries do
    member do
      get :country_show
    end
    member do
      get :country_edit
    end
  end

  resources :user_regions
  resources :user_roles
  resources :companies do 
  member do
   get :inline_edit
  end
 end

  resources :manages
  devise_for :users

  resources :regions do
    member do
      get :region_edit
      end
     end 
  
  root 'companies#index'
  

end
