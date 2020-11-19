class CartController < ApplicationController
  def main
  end

  def in_progress
    orders = Order.where(user_id: current_user)
    order_current = 0

    orders.each do |order|
      temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
      if temp.order_status_id == 1 # status en curso
        order_current = order.id
      end
    end

    @items = OrderItem.where(order_id: order_current)
  end

  def get_item
    @item = OrderItem.find(params[:item_id])
    @type = params[:option]
  end

  def remove_item
    item = OrderItem.find(params[:item])
    @items = OrderItem.where(order_id: item.order_id)
    item.destroy
  end

end
