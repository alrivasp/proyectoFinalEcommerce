class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new
    if user.is_admin?
      #Controller OrderManager
      can :main_ordermanager, :logs
      can :in_progress_orders_ordermanager, :logs
      can :pendig_orders_ordermanager, :logs
      can :finished_orders_ordermanager, :logs
      can :get_ordermanager_ordermanager, :logs
      can :cancel_order_ordermanager, :logs
      can :change_order_ordermanager, :logs
      can :search_in_progress_ordermanager, :logs
      can :search_pending_ordermanager, :logs
      can :search_finished_ordermanager, :logs
      can :search_canceled_ordermanager, :logs
      #Controller accounts
      can :dashboard_admin_accounts, :logs
      #Controller Manager
      can :profile_manager, :logs
      can :administrators_manager, :logs
      can :users_manager, :logs
      can :get_profile_manager, :logs
      can :change_user_manager, :logs
      can :change_admin_manager, :logs
      can :activate_manager, :logs
      can :inactivate_manager, :logs
      #Controller Productmanager
      can :main_productmanager, :logs
      can :active_products_productmanager, :logs
      can :inactive_products_productmanager, :logs
      can :get_productmanager_productmanager, :logs
      can :activate_productmanager, :logs
      can :inactivate_productmanager, :logs
      can :update_productmanager, :logs
      can :create_productmanager, :logs
      can :variant_products_productmanager, :logs
      can :get_variant_productmanager_productmanager, :logs
      can :create_variant_productmanager, :logs
      can :update_variant_productmanager, :logs
      can :search_inactive_productmanager, :logs
      can :search_active_productmanager, :logs
      can :search_variant_productmanager, :logs
    elsif user.is_normal_user?
      #Controller accounts
      can :dashboard_user_accounts, :logs
      #Controller Cart
      can :main_cart, :logs
      can :in_progress_cart, :logs
      can :get_item_cart, :logs
      can :remove_item_cart, :logs
      can :checkout_adress_sale_cart, :logs
      can :checkout_type_sale_cart, :logs
      can :checkout_pay_sale_cart, :logs
      can :checkout_summary_sale_cart, :logs
      can :checkout_end_sale_cart, :logs
      can :cancel_sale_cart, :logs
      can :success_sale_cart, :logs
      #Controller Shopping
      can :main_shopping, :logs
      can :in_progress_shopping, :logs
      can :pending_shopping, :logs
      can :finished_shopping, :logs
      can :canceled_shopping, :logs
      can :get_order_shopping, :logs
      can :cancel_order_shopping, :logs
      can :search_pending_shopping, :logs
      can :search_finished_shopping, :logs
      can :search_canceled_shopping, :logs
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
