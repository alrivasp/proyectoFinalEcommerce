class ShoppingController < ApplicationController
  def main
  end

  def in_progress
    orders = Order.where(user_id: current_user)
    @orders =[]
    orders.each do |order|
      temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
      if temp.order_status_id == 1
        @orders.push(order)
      end
    end
  end

  def get_order
    @order = Order.find(params[:order_id])
    @type = params[:option]
    @items = @order.order_items.all
  end

  def cancel_order
      order = Order.find(params[:order_id])
      os = OrderStatus.find(6)
      OrderHistory.create(description: os.description, order_id: order.id, order_status_id: 6)
      @orders =  Order.joins(:order_histories).where(user_id: current_user.id, order_histories:{ order_status_id: 1})
  end
end
