Rails.application.routes.draw do
  #Administrador de productos
  get 'productmanager/main'
  get 'productmanager/active_products'
  get 'productmanager/inactive_products'
  get 'get_productmanager/:product_id/:option', to: 'productmanager#get_productmanager', as: 'get_productmanager_info'
  post 'activate/:product_id', to: 'productmanager#activate', as: "activate_productmanager"
  post 'inactivate/:product_id', to: 'productmanager#inactivate', as: "inactivate_productmanager"
  post 'update', to: 'productmanager#update', as: "update_productmanager"
  post 'create', to: 'productmanager#create', as: "create_productmanager"

  #Cart
  get 'cart/main'
  get 'cart/in_progress'
  get 'get_item/:item_id/:option', to: 'cart#get_item', as: 'get_item_info'
  delete 'cart/:item', to: 'cart#remove_item', as: 'remove_cart'

  #Shopping
  get 'shopping/main'
  get 'shopping/in_progress'
  get 'get_order/:order_id/:option', to: 'shopping#get_order', as: 'get_order_info'
  post 'shopping/:order_id', to: 'shopping#cancel_order', as: "cancel_shopping"

  #products
  get 'products/main'
  get 'get_product/:product_id/:option', to: 'products#get_product', as: 'get_product_info'

  #Accounts
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
