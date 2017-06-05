Rails.application.routes.draw do
  
  resources :nodes do
    member do
      get :nodes_edit
    end
     member do 
      get :nodes_show
    end
     member do
      put "like", to: "nodes#upvote"
      put "dislike", to: "nodes#downvote"
    end
     resources :comments 
       
  end

    resources :comments, only: [] do
      member do
        put "like", to: "comments#upvote"
        put "dislike", to: "comments#downvote"
      end
    end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :places do
    collection do
      get :user_login
    end
    member do
      get :place_edit
    end
       member do
     get :place_show
  end

end
  resources :images
  resources :cities do
    collection do
      get :get_cities
    end
     member do
     get :cities_edit
    end
    member do
      get :cities_show
    end
  end
  resources :states do
    collection do
      get :get_states
    end
      member do 
      get :states_edit
    end
    member do
     get :states_show
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

  
  resources :user_regions do
    member do
      get :regions_edit
    end
     member do
      get :user_regions_show
    end
  end

  resources :user_roles do
    member do
      get :user_role_edit
    end
    member do
      get :user_role_show
    end
  end 

  resources :companies do 
   member do
     get :inline_edit
     end
    member do
      get :company_show
      post :comments
    end
 end

   resources :companies, only: [] do
      member do
        put "like", to: "companies#upvote"
        put "dislike", to: "companies#downvote"
      end
    end


  resources :manages do
    member do
      get :manange_show
    end
    
  end 

  devise_for :users 
  resources :regions do
    member do
      get :region_edit
      end
      member do
      get :region_show
    end
 end 
  
    root 'companies#index'
      resources :links do 
      member do
      put "like", to: "links#upvote"
      put "dislike", to: "links#downvote"
    end
  end


end
