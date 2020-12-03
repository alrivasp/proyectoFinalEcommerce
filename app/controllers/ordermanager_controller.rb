class OrdermanagerController < ApplicationController
  
  def main
    authorize! :main_ordermanager, :logs
  end

  #Vista principal
  def in_progress_orders
    authorize! :in_progress_orders_ordermanager, :logs
    #capturar solo las id de las ordenes
    arr_orders = Order.pluck(:id)
    @orders = []
    #Itero las ordenes y evaluo
    arr_orders.map do |order|
      oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
      if oh.order_status_id == 1
        @orders.push(oh)
      end
    end
  end
  
  #Vista principal
  def pendig_orders
    authorize! :pendig_orders_ordermanager, :logs
    #capturar solo las id de las ordenes
    arr_orders = Order.pluck(:id)
    @orders = []
    #Itero las ordenes y evaluo
    arr_orders.map do |order|
      oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
      if oh.order_status_id == 2 || oh.order_status_id == 3 || oh.order_status_id == 4 || oh.order_status_id == 5
        @orders.push(oh)
      end
    end
  end
  
  #Vista principal
  def finished_orders
    authorize! :finished_orders_ordermanager, :logs
    #capturar solo las id de las ordenes
    arr_orders = Order.pluck(:id)
    @orders = []
    #Itero las ordenes y evaluo
    arr_orders.map do |order|
      oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
      if oh.order_status_id == 8
        @orders.push(oh)
      end
    end
  end
  
  #Vista principal
  def canceled_orders
    authorize! :finished_orders_ordermanager, :logs
    #capturar solo las id de las ordenes
    arr_orders = Order.pluck(:id)
    @orders = []
    #Itero las ordenes y evaluo
    arr_orders.map do |order|
      oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
      if oh.order_status_id == 6 || oh.order_status_id == 7
        @orders.push(oh)
      end
    end
  end

  #backend seleccion de item
  def get_ordermanager
    authorize! :get_ordermanager_ordermanager, :logs
    @order = Order.find(params[:order_id])
    @order_type = @order.order_type_id
    @order_items = OrderItem.where(order_id: params[:order_id])
    @order_histories = OrderHistory.where(order_id: params[:order_id]).order(created_at: :desc)
    @type = params[:option]
  end

  #Boton cancelar
  def cancel_order
    authorize! :cancel_order_ordermanager, :logs
    sleep 2
    #Crear registro
    cancel = OrderStatus.find(7)
    OrderHistory.create(description: cancel.description, order_id: params[:order_id], order_status_id: cancel.id)

    #capturar solo las id de las ordenes
    arr_orders = Order.pluck(:id)
    @orders = []
    #Itero las ordenes y evaluo
    arr_orders.map do |order|
      oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
      if oh.order_status_id == 1
        @orders.push(oh)
      end
    end
  end

  #bonton cambio de orden pendiente
  def change_order
    authorize! :change_order_ordermanager, :logs
    order = Order.find(params[:order_id].to_i)
    status = OrderStatus.find(params[:order_status_id][0].to_i)

    OrderHistory.create( description: status.description , order_id: order.id , order_status_id: status.id )
    #update en tabla payment
    if order.payments.first.payment_method_id == 1 || order.payments.first.payment_method_id == 2
      if status.id == 7
        order.payments.first.status = "Orden Cancelada"
        order.save
      elsif status.id == 8 || status.id == 4 || status.id == 5
        order.payments.first.status = "Pagado"
        order.save
        #descontar stock
        order.order_items.each do |item|
          item.variant.stock -= 1
          item.variant.save
        end
      end
    end
     #capturar solo las id de las ordenes
     arr_orders = Order.pluck(:id)
     @orders = []
     #Itero las ordenes y evaluo
     arr_orders.map do |order|
       oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
       if oh.order_status_id == 2 || oh.order_status_id == 3 || oh.order_status_id == 4 || oh.order_status_id == 5
         @orders.push(oh)
       end
     end
  end

  #Backend Busqueda en curso
  def search_in_progress
    authorize! :search_in_progress_ordermanager, :logs
    respond_to do |format|
      if params[:search]
        

        #capturar solo las id de las ordenes
        arr_orders = Order.where('number LIKE ?', "%#{params[:search]}%").order(number: :desc)
        @orders = []
        #Itero las ordenes y evaluo
        arr_orders.map do |order|
          oh= OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          if oh.order_status_id == 1
            @orders.push(oh)
          end
        end
        format.js
      else
        #capturar solo las id de las ordenes
        arr_orders = Order.pluck(:id)
        @orders = []
        #Itero las ordenes y evaluo
        arr_orders.map do |order|
          oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
          if oh.order_status_id == 1
            @orders.push(oh)
          end
        end
        format.js
      end
    end
  end
  
  #Backend Busqueda pendiente
  def search_pending
    authorize! :search_pending_ordermanager, :logs
    respond_to do |format|
      if params[:search]
        #capturar solo las id de las ordenes
        arr_orders = Order.where('number LIKE ?', "%#{params[:search]}%").order(number: :desc)
        @orders = []
        #Itero las ordenes y evaluo
        arr_orders.map do |order|
          oh= OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          if oh.order_status_id == 2 || oh.order_status_id == 3 || oh.order_status_id == 4 || oh.order_status_id == 5
            @orders.push(oh)
          end
        end
        format.js
      else
        #capturar solo las id de las ordenes
        arr_orders = Order.pluck(:id)
        @orders = []
        #Itero las ordenes y evaluo
        arr_orders.map do |order|
          oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
          if oh.order_status_id == 2 || oh.order_status_id == 3 || oh.order_status_id == 4 || oh.order_status_id == 5
            @orders.push(oh)
          end
        end
        format.js
      end
    end
  end

  #Backend Busqueda finalizada
  def search_finished
    authorize! :search_finished_ordermanager, :logs
    respond_to do |format|
      if params[:search]
        #capturar solo las id de las ordenes
        arr_orders = Order.where('number LIKE ?', "%#{params[:search]}%").order(number: :desc)
        @orders = []
        #Itero las ordenes y evaluo
        arr_orders.map do |order|
          oh= OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          if oh.order_status_id == 8 
            @orders.push(oh)
          end
        end
        format.js
      else
        #capturar solo las id de las ordenes
        arr_orders = Order.pluck(:id)
        @orders = []
        #Itero las ordenes y evaluo
        arr_orders.map do |order|
          oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
          if oh.order_status_id == 8
            @orders.push(oh)
          end
        end
        format.js
      end
    end
  end

  #Backend Busqueda cancelada
  def search_canceled
    authorize! :search_canceled_ordermanager, :logs
    respond_to do |format|
      if params[:search]
        #capturar solo las id de las ordenes
        arr_orders = Order.where('number LIKE ?', "%#{params[:search]}%").order(number: :desc)
        @orders = []
        #Itero las ordenes y evaluo
        arr_orders.map do |order|
          oh= OrderHistory.where(order_id: order.id).order(created_at: :desc).first
          if oh.order_status_id == 6 || oh.order_status_id == 7
            @orders.push(oh)
          end
        end
        format.js
      else
        #capturar solo las id de las ordenes
        arr_orders = Order.pluck(:id)
        @orders = []
        #Itero las ordenes y evaluo
        arr_orders.map do |order|
          oh= OrderHistory.where(order_id: order).order(created_at: :desc).first
          if oh.order_status_id == 6 || oh.order_status_id == 7
            @orders.push(oh)
          end
        end
        format.js
      end
    end
  end

end
