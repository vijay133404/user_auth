
module ApplicationHelper
    def user_permission_admin?
       if current_user
         UserRole.find(current_user.role_id).role_name == "admin"
       else
       false
       end
    end

    

    def user_permission_user?
       if current_user
         UserRole.find(current_user.role_id).role_name == "user"
       else
       false
       end
    end

    def user_check(manage, curr_user)
        if UserRole.find(curr_user.role_id).role_name == "manager"
            if  manage.company_id == curr_user.company_id
              true
            else
              false
            end
       


        else
        false
        end
    end
end

