class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update) {
        |u| u.permit(:email,
                     :avatar,
                     :user_name,
                     :name,
                     :last_name,
                     :born_date,
                     :gender,
                     :phone,
                     :rut,
                     :street,
                     :commune_id,
                     :password,
                     :password_confirmation,
                     :current_password
                    )
        }
    end

    rescue_from CanCan::AccessDenied do |exception|
        respond_to do |format|
            format.json { head :forbidden, content_type: 'text/html' }
            format.html { redirect_to main_app.root_url, notice: exception.message }
            format.js   { head :forbidden, content_type: 'text/html' }
        end
    end
    def after_sign_in_path_for(resource) 

        if current_user.permission_level == 1
            accounts_dashboard_admin_path
        else
            accounts_dashboard_user_path
        end
  
    end
end
