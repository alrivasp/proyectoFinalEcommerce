Rails.application.routes.draw do
  #Administrador de Ordenes
  get 'ordermanager/main'
  get 'ordermanager/in_progress_orders'
  get 'ordermanager/pendig_orders'
  get 'ordermanager/finished_orders'
  get 'ordermanager/canceled_orders'
  ##Obtener info
  get 'get_ordermanager/:order_id/:option', to: 'ordermanager#get_ordermanager', as: 'get_ordermanager_info'
  ##Cancelar Orden
  post 'cancel/:order_id', to: 'ordermanager#cancel_order', as: "cancel_order_ordermanager"
  get 'change_status_ordermanager', to: 'ordermanager#change_order', as: "change_order_ordermanager"
  ##Busqueda
  get 'search_in_progress_ordermanager', to: 'ordermanager#search_in_progress', as: 'search_in_progress_ordermanager'
  get 'search_pending_ordermanager', to: 'ordermanager#search_pending', as: 'search_pending_ordermanager'
  get 'search_finished_ordermanager', to: 'ordermanager#search_finished', as: 'search_finished_ordermanager'
  get 'search_canceled_ordermanager', to: 'ordermanager#search_canceled', as: 'search_canceled_ordermanager'
  ###############################################################################################################################
  #Administrador de productos
  get 'productmanager/main'
  get 'productmanager/active_products'
  get 'productmanager/inactive_products'
  get 'productmanager/variant_products'
  ##Obtener info
  get 'get_productmanager/:product_id/:option', to: 'productmanager#get_productmanager', as: 'get_productmanager_info'
  get 'get_variant_productmanager/:variant_id/:option', to: 'productmanager#get_variant_productmanager', as: 'get_variant_productmanager_info'
  ##Crud Variant
  post 'createVariant', to: 'productmanager#create_variant', as: "create_variant_productmanager"
  post 'updateVariant', to: 'productmanager#update_variant', as: "update_variant_productmanager"
  ##Crud Producto
  post 'activate/:product_id', to: 'productmanager#activate', as: "activate_productmanager"
  post 'inactivate/:product_id', to: 'productmanager#inactivate', as: "inactivate_productmanager"
  post 'update', to: 'productmanager#update', as: "update_productmanager"
  post 'create', to: 'productmanager#create', as: "create_productmanager"
  ##Busqueda
  get 'search_inactive_productmanager', to: 'productmanager#search_inactive', as: 'search_inactive_productmanager'
  get 'search_active_productmanager', to: 'productmanager#search_active', as: 'search_active_productmanager'
  get 'search_variant_productmanager', to: 'productmanager#search_variant', as: 'search_variant_productmanager'
  ###############################################################################################################################
  #Cart
  get 'cart/main'
  get 'cart/in_progress'
  get 'get_item/:item_id/:option', to: 'cart#get_item', as: 'get_item_info'
  delete 'cart/:item', to: 'cart#remove_item', as: 'remove_cart'
  get 'cancel_sale/:order_id', to: 'cart#cancel_sale', as: 'cancel_sale_cart'
  get 'pay_sale/:order_id', to: 'cart#pay_sale', as: 'pay_sale_cart'
  get 'checkout_adress_sale/:order_id', to: 'cart#checkout_adress_sale', as: 'checkout_adress_sale_cart'
  get 'checkout_type_sale', to: 'cart#checkout_type_sale', as: 'checkout_type_sale_cart'
  post 'checkout_pay_sale', to: 'cart#checkout_pay_sale', as: 'checkout_pay_sale_cart'
  post 'checkout_summary_sale', to: 'cart#checkout_summary_sale', as: 'checkout_summary_sale_cart'
  post 'checkout_end_sale/:payment_method_id', to: 'cart#checkout_end_sale', as: 'checkout_end_sale_cart'
  post 'checkout_paypal_sale', to: 'cart#checkout_paypal_sale', as: 'checkout_paypal_sale_cart'
  ###############################################################################################################################
  #Shopping
  get 'shopping/main'
  get 'shopping/in_progress'
  get 'shopping/pending'
  get 'shopping/finished'
  get 'shopping/canceled'
  get 'get_order/:order_id/:option', to: 'shopping#get_order', as: 'get_order_info'
  post 'shopping/:order_id', to: 'shopping#cancel_order', as: "cancel_shopping"
  ##Busqueda
  get 'search_pending_shopping', to: 'shopping#search_pending', as: 'search_pending_shopping'
  get 'search_finished_shopping', to: 'shopping#search_finished', as: 'search_finished_shopping'
  get 'search_canceled_shopping', to: 'shopping#search_canceled', as: 'search_canceled_shopping'
  ###############################################################################################################################
  #products
  get 'products/main'
  get 'get_product/:product_id/:option', to: 'products#get_product', as: 'get_product_info'
  ###############################################################################################################################
  #Accounts
  get 'accounts/dashboard_admin'
  get 'accounts/dashboard_user'
  ###############################################################################################################################
  #Manager
  get 'manager/profile'
  get 'manager/administrators'
  get 'manager/users'
  get 'get_profile/:user_id/:option', to: 'manager#get_profile', as: 'get_profile_info'
  post 'changeuser/:user_id', to: 'manager#change_user', as: "changeuser_manager"
  post 'changeadmin/:user_id', to: 'manager#change_admin', as: "changeadmin_manager"
  post 'activate/:user_id', to: 'manager#activate', as: "activate_manager"
  post 'inactivate/:user_id', to: 'manager#inactivate', as: "inactivate_manager"
  ###############################################################################################################################
  #devise_for :users
  devise_for :users, controllers:{
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  ###############################################################################################################################
  #Home
  get 'home/index'
  ###############################################################################################################################
  #Default
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
