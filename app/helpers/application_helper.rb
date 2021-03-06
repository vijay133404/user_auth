
module ApplicationHelper
  def resource_name
        :user
    end

    def resource
        @resource ||= User.new
    end

    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end
    
    def user_permission_admin?
       if current_user.present?

         UserRole.find(current_user.role_id).role_name == "admin"
       else
       false
       end
    end

    

    def user_permission_check(manage, current_user)
   
        if UserRole.find(current_user.role_id).role_name == "user"
       if  manage.id == current_user.id
         true
       else
       false
         end
      
     end
    end


    def user_check(manage, curr_user)
  
        if UserRole.find(curr_user.role_id).role_name == "manager"
           if  manage.company_id == curr_user.company_id
              true
            else
              false
            end
       
      end
    end


    
end

