class ProductsController < ApplicationController
  def main
    @products = Product.where(available: true).order(created_at: :desc)
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
    validate_comment = Review.where(user_id: current_user.id).where(product_id: @product.id)
    @comment = validate_comment[0].body
    @products = Product.where(available: true).order(created_at: :desc)
  end

  def add_product
    if user_signed_in?
      sleep 2
      order_current = Order.where(user_id: current_user).order(created_at: :desc).first
      if order_current.nil?
        order = Order.new
        order.user_id = current_user.id
        order.order_type_id = 1
        order.save
        order.add_history
        order.add_variant( params[:variant_id], 1 )
        order.compute_total
      else
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
      review.save
      @product = Product.find(params[:product_id].to_i)
    else
      #sobre escribir comentario
      review_id = Review.where(user_id: current_user.id, product_id: params[:product_id].to_i)[0].id
      review = Review.find(review_id)
      review.title = params[:title_review].to_s
      review.body = params[:body_review].to_s
      review.save
      @product = Product.find(params[:product_id].to_i)
    end
    validate_comment = Review.where(user_id: current_user.id).where(product_id: @product.id)
    @comment = validate_comment[0].body
    @product = Product.find(params[:product_id].to_i)
  end
  
  def search_product
    respond_to do |format|
      if params[:search_product]
        products = Product.where(available: true)
        @products = products.where('name LIKE ?', "%#{params[:search_product]}%").order(created_at: :desc)
        format.js
      else
        @products = Product.where(available: true).order(created_at: :desc)
        format.js
      end
    end
  end

  def filter_product
    respond_to do |format|
      option = params[:filter_id][0]
      if option == "1" #mayor precio
        @products = Product.where(available: true).order(price: :desc)
        format.js
      elsif option == "2" #menor precio
        @products = Product.where(available: true).order(price: :asc)
        format.js
      elsif option == "3" #mejor valorado
        products = Product.where(available: true)
        temp = {}
        @products = []
        products.each do |product|
          temp["#{product.id}"] =  product.reviews.average(:punctuation).to_i
        end
        arr_product_ordered = temp.sort_by {|_key, value| value}.reverse
        arr_product_ordered.each do |index|
          @products << Product.find(index[0].to_i)
        end
        format.js
      elsif option == "4" #mas antiguo
        @products = Product.where(available: true).order(created_at: :asc)
        format.js
      else #mas nuevo
        @products = Product.where(available: true).order(created_at: :desc)
        format.js
      end
    end
  end
  
  
end
