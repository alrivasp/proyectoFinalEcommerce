class CartController < ApplicationController
  def main
  end
  
  def in_progress
    #Capturo la ultima orden del usuario logeado
    order_current = Order.where(user_id: current_user).order(created_at: :desc).first
    #Capturo la ultima historia de la orden
    oh = order_current.order_histories.order(created_at: :desc).first
    #Evaluo si la ultima historia es curso
    #si es en curso capturar los item de la orden de lo contrario enviar array vacio
    @items = []
    if oh.order_status_id == 1
      @items = order_current.order_items
    end
    @order = Order.where(user_id: current_user).order(created_at: :desc).first
  end

  def get_item
    @item = OrderItem.find(params[:item_id])
    @type = params[:option]
  end

  def remove_item
    item = OrderItem.find(params[:item])
    @items = OrderItem.where(order_id: item.order_id)
    item.destroy
    @order = Order.find(item.order_id)
    @order.compute_total
  end

  def checkout_adress_sale
    sleep 2
    @user = current_user
    @order = Order.find(params[:order_id])
  end

  def checkout_type_sale
    sleep 2
    @order = Order.where(user_id: current_user).order(created_at: :desc).first
    
  end
  
  def checkout_pay_sale
    sleep 2
    @order = Order.where(user_id: current_user).order(created_at: :desc).first
    @order.order_type_id = params[:order_type_id_check][0].to_i
    @order.save
  end
  
  def checkout_summary_sale
    sleep 2
    @order = Order.where(user_id: current_user).order(created_at: :desc).first
    @pm= PaymentMethod.find(params[:payment_method_id][0].to_i)
  end

  def checkout_end_sale
    sleep 2
    pm= PaymentMethod.find(params[:payment_method_id][0].to_i)
    @order = Order.where(user_id: current_user).order(created_at: :desc).first

    if @order.order_type_id == 1
      os = OrderStatus.find(2)
      OrderHistory.create(description: os.description, order_id: @order.id, order_status_id: os.id)
      Payment.create(order_id: @order.id, payment_method_id: pm.id, status: "Pendiente", total: @order.total, token: "")
    else
      os = OrderStatus.find(3)
      OrderHistory.create(description: os.description, order_id: @order.id, order_status_id: os.id)
      Payment.create(order_id: @order.id, payment_method_id: pm.id, status: "Pendiente", total: @order.total, token: "")
    end
    #Capturo la ultima orden del usuario logeado
    order_current = Order.where(user_id: current_user).order(created_at: :desc).first
    #Capturo la ultima historia de la orden
    oh = order_current.order_histories.order(created_at: :desc).first
    #Evaluo si la ultima historia es curso
    #si es en curso capturar los item de la orden de lo contrario enviar array vacio
    @items = []
    if oh.order_status_id == 1
      @items = order_current.order_items
    end
  end
  
  def checkout_paypal_sale
    sleep 2
    #Payment.create(order_id: @order.id, payment_method_id: @pm.id, status: "Pendiente", total: @order.total, token: "")
  end
  
  
  def cancel_sale
    sleep 2
    oc = Order.find(params[:order_id])
    os = OrderStatus.find(6)
    if OrderHistory.create(description: os.description, order_id: oc.id, order_status_id: os.id)
        #Capturo la ultima orden del usuario logeado
        order_current = Order.where(user_id: current_user).order(created_at: :desc).first
        #Capturo la ultima historia de la orden
        oh = order_current.order_histories.order(created_at: :desc).first
        #Evaluo si la ultima historia es curso
        #si es en curso capturar los item de la orden de lo contrario enviar array vacio
        @items = []
        if oh.order_status_id == 1
          @items = order_current.order_items
        end
    end
  end

end
