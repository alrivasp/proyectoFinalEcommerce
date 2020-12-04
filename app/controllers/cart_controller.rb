include SendGrid

class CartController < ApplicationController
  def main
    authorize! :main_cart, :logs
  end
  
  def in_progress
    authorize! :in_progress_cart, :logs
    #Capturo la ultima orden del usuario logeado
    order_current = Order.where(user_id: current_user).order(created_at: :desc).first
    if !order_current.nil?
      oh = order_current.order_histories.order(created_at: :desc).first
      #Capturo la ultima historia de la orden
      #Evaluo si la ultima historia es curso
      #si es en curso capturar los item de la orden de lo contrario enviar array vacio
      @items = []
      if oh.order_status_id == 1
        @items = order_current.order_items
      end
      @order = Order.where(user_id: current_user).order(created_at: :desc).first
    else
      @order = nil
    end
  end

  def get_item
    authorize! :get_item_cart, :logs
    @item = OrderItem.find(params[:item_id])
    @type = params[:option]
  end

  def remove_item
    authorize! :remove_item_cart, :logs
    item = OrderItem.find(params[:item])
    @items = OrderItem.where(order_id: item.order_id)
    item.destroy
    @order = Order.find(item.order_id)
    @order.compute_total
  end

  def checkout_adress_sale
    authorize! :checkout_adress_sale_cart, :logs
    sleep 2
    @user = current_user
    @order = Order.find(params[:order_id])
  end

  def checkout_type_sale
    authorize! :checkout_type_sale_cart, :logs
    sleep 2
    @order = Order.where(user_id: current_user).order(created_at: :desc).first
    
  end
  
  def checkout_pay_sale
    authorize! :checkout_pay_sale_cart, :logs
    sleep 2
    @order = Order.where(user_id: current_user).order(created_at: :desc).first
    @order.order_type_id = params[:order_type_id_check][0].to_i
    @order.save
  end
  
  def checkout_summary_sale
    authorize! :checkout_summary_sale_cart, :logs
    sleep 2
    @order = Order.where(user_id: current_user).order(created_at: :desc).first
    @pm= PaymentMethod.find(params[:payment_method_id][0].to_i)
  end

  def checkout_end_sale
    authorize! :checkout_end_sale_cart, :logs
    sleep 2
    #capturo metodo de pago
    pm= PaymentMethod.find(params[:payment_method_id][0].to_i)
    #busco la ultima orden
    @order = Order.where(user_id: current_user).order(created_at: :desc).first

    if @order.order_type_id == 1 #orden el despacho es contra entrega
      os = OrderStatus.find(2) #capturo el estado pendiente de contra entrega
      OrderHistory.create(description: os.description, order_id: @order.id, order_status_id: os.id)# agrego un historial con pendiente de contra entrega
      Payment.create(order_id: @order.id, payment_method_id: pm.id, status: "Pendiente", total: @order.total, token: "")#agrego un pago a la orden en pendiente
    else #orden el despacho a regiones
      os = OrderStatus.find(3)
      OrderHistory.create(description: os.description, order_id: @order.id, order_status_id: os.id)
      Payment.create(order_id: @order.id, payment_method_id: pm.id, status: "Pendiente", total: @order.total, token: "")
    end
    
    

    #Correo
    from    = Email.new(email: 'alvaro.rivas.p@outlook.com')
    to      = Email.new(email: "#{current_user.email}")
    subject = "#{@order.number} | Jeans Lover Shop"

    if pm == 1 && @order.order_type_id == 1
      content = Content.new(type: "text/plain", value: "Estimado #{current_user.name} #{current_user.last_name} \n
        Su pedido se realizo con exito, y pasó a estado pendiente de (entrega o despacho), como solicito\n
        despacho contra entrega el pago se realiza cuando se entregue el producto en el lugar y fecha acordada, \n
        nos contactaremos con usted para coordinar la entrega del o los productos solicitados \n
        de igual manera se envio un correo cofirmando el pedido realizado le agradecemos por su compra \n
        y por preferir nuestro productos !!!!Muchas gracias... \n
        \n Atentamente Equipo Jeans Lovers Shop.-" )
    elsif pm == 2 && @order.order_type_id == 1
      content = Content.new(type: "text/plain", value: "Estimado #{current_user.name} #{current_user.last_name} \n
        Su pedido se realizo con exito, y pasó a estado pendiente de (entrega o despacho), como solicito\n
        despacho contra entrega y pago via transferencia se verificara antes de proceder a la entrega en el lugar y fecha acordada, \n
        nos contactaremos con usted para coordinar la entrega del o los productos solicitados \n
        de igual manera se envio un correo cofirmando el pedido realizado le agradecemos por su compra \n
        y por preferir nuestro productos !!!!Muchas gracias... \n
        \n Atentamente Equipo Jeans Lovers Shop.-" )
    else pm == 2 && @order.order_type_id == 1
      content = Content.new(type: "text/plain", value: "Estimado #{current_user.name} #{current_user.last_name} \n
        Su pedido se realizo con exito, y pasó a estado pendiente de (entrega o despacho), como solicito\n
        despacho a regiones el pago se realiza mediante transferencia se verificara antes de proceder al despacho del producto, \n
        nos contactaremos con usted para coordinar el envio del o los productos solicitados \n
        de igual manera se envio un correo cofirmando el pedido realizado le agradecemos por su compra \n
        y por preferir nuestro productos !!!!Muchas gracias... \n
        \n Atentamente Equipo Jeans Lovers Shop.-" )
    end
    email_from_ruby = Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['API_KEY'])
    response = sg.client.mail._('send').post(request_body: email_from_ruby.to_json)

    if response.status_code == "202"
      redirect_to success_sale_cart_path(@order)
    end
    
  end

  def cancel_sale
    authorize! :cancel_sale_cart, :logs
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

  def success_sale
    authorize! :success_sale_cart, :logs
    @order = Order.find(params[:order_id])
  end
  
end
