class OrdermanagerController < ApplicationController
  def main
  end

  #Vista principal
  def in_progress_orders
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
    @order = Order.find(params[:order_id])
    @order_type = @order.order_type_id
    @order_items = OrderItem.where(order_id: params[:order_id])
    @order_histories = OrderHistory.where(order_id: params[:order_id]).order(created_at: :desc)
    @type = params[:option]
  end

  #Boton cancelar
  def cancel_order
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
