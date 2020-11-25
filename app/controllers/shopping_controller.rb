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

  def pending
    #capturo las ordenes del cliente logeado
    orders = Order.where(user_id: current_user)
    @orders =[]
    #itero las ordenes
    orders.each do |order|
      temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
      #capturo los estados pendientes
      if temp.order_status_id == 2 || temp.order_status_id == 3 || temp.order_status_id == 4 || temp.order_status_id == 5
        @orders.push(order)
      end
    end
  end
  
  def finished
    #capturo las ordenes del cliente logeado
    orders = Order.where(user_id: current_user)
    @orders =[]
    #itero las ordenes
    orders.each do |order|
      temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
      #capturo los estados pendientes
      if temp.order_status_id == 8
        @orders.push(order)
      end
    end
  end
  
  def canceled
    #capturo las ordenes del cliente logeado
    orders = Order.where(user_id: current_user)
    @orders =[]
    #itero las ordenes
    orders.each do |order|
      temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
      #capturo los estados pendientes
      if temp.order_status_id == 6 || temp.order_status_id == 7
        @orders.push(order)
      end
    end
  end

  def get_order
    @order = Order.find(params[:order_id])
    @type = params[:option]
    @items = @order.order_items.all
    @order_histories = OrderHistory.where(order_id: @order.id).order(created_at: :desc)
  end

  def cancel_order
      order = Order.find(params[:order_id])
      os = OrderStatus.find(6)
      OrderHistory.create(description: os.description, order_id: order.id, order_status_id: 6)
      #@orders =  Order.joins(:order_histories).where(user_id: current_user.id, order_histories:{ order_status_id: 1})
      orders = Order.where(user_id: current_user)
      @orders =[]
      orders.each do |order|
        temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
        if temp.order_status_id == 1
          @orders.push(order)
        end
      end
  end

  #Backend Busqueda en pendiente
  def search_pending
    respond_to do |format|
      if params[:search]
        #capturo las ordenes del cliente logeado
        orders = Order.where(user_id: current_user.id).where('number LIKE ?', "%#{params[:search]}%").order(number: :desc)
        @orders =[]
        #itero las ordenes
        orders.each do |order|
          temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          #capturo los estados pendientes
          if temp.order_status_id == 2 || temp.order_status_id == 3 || temp.order_status_id == 4 || temp.order_status_id == 5
            @orders.push(order)
          end
        end
        format.js
      else
        #capturo las ordenes del cliente logeado
        orders = Order.where(user_id: current_user)
        @orders =[]
        #itero las ordenes
        orders.each do |order|
          temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          #capturo los estados pendientes
          if temp.order_status_id == 2 || temp.order_status_id == 3 || temp.order_status_id == 4 || temp.order_status_id == 5
            @orders.push(order)
          end
        end
        format.js
      end
    end
  end

  #Backend Busqueda en finalizado
  def search_finished
    respond_to do |format|
      if params[:search]
        #capturo las ordenes del cliente logeado
        orders = Order.where(user_id: current_user.id).where('number LIKE ?', "%#{params[:search]}%").order(number: :desc)
        @orders =[]
        #itero las ordenes
        orders.each do |order|
          temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          #capturo los estados pendientes
          if temp.order_status_id == 8
            @orders.push(order)
          end
        end
        format.js
      else
        #capturo las ordenes del cliente logeado
        orders = Order.where(user_id: current_user)
        @orders =[]
        #itero las ordenes
        orders.each do |order|
          temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          #capturo los estados pendientes
          if temp.order_status_id == 8
            @orders.push(order)
          end
        end
        format.js
      end
    end
  end

  #Backend Busqueda en Cancelados
  def search_canceled
    respond_to do |format|
      if params[:search]
        #capturo las ordenes del cliente logeado
        orders = Order.where(user_id: current_user.id).where('number LIKE ?', "%#{params[:search]}%").order(number: :desc)
        @orders =[]
        #itero las ordenes
        orders.each do |order|
          temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          #capturo los estados pendientes
          if temp.order_status_id == 6 || temp.order_status_id == 7
            @orders.push(order)
          end
        end
        format.js
      else
        #capturo las ordenes del cliente logeado
        orders = Order.where(user_id: current_user)
        @orders =[]
        #itero las ordenes
        orders.each do |order|
          temp = OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          #capturo los estados pendientes
          if temp.order_status_id == 6 || temp.order_status_id == 7
            @orders.push(order)
          end
        end
        format.js
      end
    end
  end
end
