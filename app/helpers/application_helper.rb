module ApplicationHelper
    def user_permission_admin?
       if current_user
         UserRole.find(current_user.role_id).role_name == "Admin"
       else
       false
       end
    end

    def user_permission_manager?
       if current_user
         UserRole.find(current_user.role_id).role_name == "Manager"
       else
       false
       end
    end

    def user_permission_user?
       if current_user
         UserRole.find(current_user.role_id).role_name == "User"
       else
       false
       end
    end
end


