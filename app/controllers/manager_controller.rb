class ManagerController < ApplicationController
    def profile
        authorize! :profile_manager, :logs
    end

    def administrators
        authorize! :administrators_manager, :logs
        @users = User.where(permission_level: 1)
    end

    def users
        authorize! :users_manager, :logs
        @users = User.where(permission_level: 0)
    end

    def get_profile
        authorize! :get_profile_manager, :logs
        @user = User.find(params[:user_id])
        @type = params[:option]
    end

    def change_user
        authorize! :change_user_manager, :logs
        @user = User.find(params[:user_id])
        @user.permission_level = 0
        @user.save
        @users = User.where(permission_level: 1)
    end

    def change_admin
        authorize! :change_admin_manager, :logs
        @user = User.find(params[:user_id])
        @user.permission_level = 1
        @user.save
        @users = User.where(permission_level: 0)
    end

    def activate
        authorize! :activate_manager, :logs
        @user = User.find(params[:user_id])
        @user.deactivated = false
        @user.save
        if @user.permission_level == 0
            @users = User.where(permission_level: 0)
            @type = 0
        else
            @users = User.where(permission_level: 1)
            @type = 1
        end
    end
    
    def inactivate
        authorize! :inactivate_manager, :logs
        @user = User.find(params[:user_id])
        @user.deactivated = true
        @user.save
        if @user.permission_level == 0
            @users = User.where(permission_level: 0)
            @type = 0
        else
            @users = User.where(permission_level: 1)
            @type = 1
        end
    end
end
