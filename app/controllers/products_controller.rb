class ProductsController < ApplicationController
  def main
    @products = Product.all
  end

  def get_product
    @product = Product.find(params[:product_id])
    @type = params[:option]

    @variants = Variant.where(product_id: @product.id)
  end

  def punctiation_product
    sleep 2
    #El Usuario tiene registro del producto en review?
    if Review.where(user_id: current_user.id, product_id: params[:product_id].to_i).length  == 0
      #nueva puntuacion
      review = Review.new
      review.user_id = current_user.id
      review.product_id = params[:product_id].to_i
      review.punctuation = params[:punctuation_id][0].to_i
      review.save
    else
      #sobre escribir puntuacion
      review_id = Review.where(user_id: current_user.id, product_id: params[:product_id].to_i)[0].id
      review = Review.find(review_id)
      review.punctuation = params[:punctuation_id][0].to_i
      review.save
    end
    @product = Product.find(params[:product_id].to_i)
    @products = Product.all
  end

  def add_product
    if user_signed_in?
      sleep 2
      #Validar si existe una orden en curso
      if current_user.orders.last.order_histories.last.order_status_id == 1 ##en curso
        order = Order.find(current_user.orders.last.id)
        order.add_variant( params[:variant_id], 1)
        order.compute_total
      else ##no tiene orden en curso
        order = Order.new
        order.user_id = current_user.id
        order.order_type_id = 1
        order.save
        order.add_history
        order.add_variant( params[:variant_id], 1 )
        order.compute_total
      end
    else
      redirect_to new_user_session_path
    end

  end 

  def comment_product
    sleep 2
    #El Usuario tiene registro del producto en review?
    if Review.where(user_id: current_user.id, product_id: params[:product_id].to_i).length  == 0
      #nueva comentario
      review = Review.new
      review.user_id = current_user.id
      review.product_id = params[:product_id].to_i
      review.title = params[:title_review].to_s
      review.body = params[:body_review].to_s
      byebug
      review.save
    else
      #sobre escribir puntuacion
      review_id = Review.where(user_id: current_user.id, product_id: params[:product_id].to_i)[0].id
      review = Review.find(review_id)
      review.title = params[:title_review].to_s
      review.body = params[:body_review].to_s
      review.save
    end
    @product = Product.find(params[:product_id].to_i)
  end
  

end
