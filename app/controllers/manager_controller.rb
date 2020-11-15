class ManagerController < ApplicationController
    def profile
    end

    def administrators
        @users = User.where(permission_level: 1)
    end

    def users
        @users = User.where(permission_level: 0)
    end

    def get_profile
        @user = User.find(params[:user_id])
        @type = params[:option]
    end

    def change_user
        @user = User.find(params[:user_id])
        @user.permission_level = 0
        @user.save
        @users = User.where(permission_level: 1)
    end

    def change_admin
        @user = User.find(params[:user_id])
        @user.permission_level = 1
        @user.save
        @users = User.where(permission_level: 0)
    end

    def activate
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
