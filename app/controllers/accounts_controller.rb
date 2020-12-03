class AccountsController < ApplicationController
  def dashboard_admin
    authorize! :dashboard_admin_accounts, :logs
    @total_purshaces_day = Order.joins(:order_histories)
                                .where(order_histories: {order_status_id: 8})
                                .group_by_day(:created_at, day_start: 1).sum(:total)

    @quantity_purshaces_day = Order.joins(:order_histories)
                                .where(order_histories: {order_status_id: 8})
                                .group_by_day(:created_at, day_start: 1).count

    @quantity_purshaces_12_moths = Order.joins(:order_histories)
                                        .where(order_histories: {order_status_id: 8})
                                        .group_by_month(:created_at, format: "%b %Y").count

    @total_purshaces_12_moths = Order.joins(:order_histories)
                                        .where(order_histories: {order_status_id: 8})
                                        .group_by_month(:created_at, format: "%b %Y").sum(:total)

    @quantity_in_progress_12_moths = Order.joins(:order_histories)
                                          .where(order_histories: {order_status_id: 1})
                                          .group_by_month(:created_at, format: "%b %Y").count

    @quantity_pending_12_moths = Order.joins(:order_histories)
                                      .where(order_histories: {order_status_id: [2,3,4,5]})
                                      .group_by_month(:created_at, format: "%b %Y").count

    @quantity_canceled_by_user_12_moths = Order.joins(:order_histories)
                                      .where(order_histories: {order_status_id: 6})
                                      .group_by_month(:created_at, format: "%b %Y").count
   
    #@type_delivery = OrderType.joins(:orders).group("order_types.id, orders.order_type_id").select("order_types.*, count(orders.id) as cuenta_tweets").collect{|x| [x.name, x.cuenta_tweets]}
   
  end

  def dashboard_user
    authorize! :dashboard_user_accounts, :logs
    @quantity_purshaces_12_moths = Order.joins(:order_histories)
                                        .where(order_histories: {order_status_id: 8})
                                        .where(user_id: current_user.id)
                                        .group_by_month(:created_at, format: "%b %Y").count

    @total_purshaces_12_moths = Order.joins(:order_histories)
                                     .where(order_histories: {order_status_id: 8})
                                     .where(user_id: current_user.id)
                                     .group_by_month(:created_at, format: "%b %Y").sum(:total)

  end
end
