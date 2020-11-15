Rails.application.routes.draw do
  #Acconuts
  get 'accounts/dashboard_admin'
  get 'accounts/dashboard_user'

  #Manager
  get 'manager/profile'
  get 'manager/administrators'
  get 'manager/users'
  get 'get_profile/:user_id/:option', to: 'manager#get_profile', as: 'get_profile_info'
  post 'changeuser/:user_id', to: 'manager#change_user', as: "changeuser_manager"
  post 'changeadmin/:user_id', to: 'manager#change_admin', as: "changeadmin_manager"
  post 'activate/:user_id', to: 'manager#activate', as: "activate_manager"
  post 'inactivate/:user_id', to: 'manager#inactivate', as: "inactivate_manager"


  #devise_for :users
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  #Home
  get 'home/index'

  #Default
  root 'home#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
