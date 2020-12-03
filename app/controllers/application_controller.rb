class ApplicationController < ActionController::Base
    before_action :initial_permitted_parameters, if: :devise_controller?
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

    def initial_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) {
        |u| u.permit(:email,
                     :commune_id,
                     :password,
                     :password_confirmation
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

    def current_order
        #Valida si Usuario esta Logeado
        if current_user
            #Buscar ordenes del usuario actual
            orders = Order.where(user_id: currente_user.id)
            #verificar ultima order history si estado es en curso (FK 1) pasar como orden actual
            orders.each do |order|
                temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
                if temp.order_status_id == 1 # status en curso
                    return order
                end
            end
        end
        return nil
    end

end
