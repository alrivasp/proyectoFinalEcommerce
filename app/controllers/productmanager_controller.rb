class ProductmanagerController < ApplicationController
  def main
    
    
  end

  def active_products
    
    #@products = Product.joins(:variants).where(available: true)
    @products = Product.where(available: true)

  end
  
  def inactive_products
    
    @products = Product.where(available: false)
  end

  def get_productmanager
    
    @product = Product.find(params[:product_id])
    @type = params[:option]

    @variants = Variant.where(product_id: @product.id)
  end
  
  def activate
    
    sleep 2
    product = Product.find(params[:product_id])
    product.available = true
    product.save
    @products = Product.where(available: false)
  end

  def inactivate
    
    sleep 2
    product = Product.find(params[:product_id])
    product.available = false
    product.save
    @products = Product.where(available: true)
  end
  
  def update
    product = Product.find(product_params[:id])

    @products_active = Product.where(available: true)
    @products_inactive = Product.where(available: false)
    
    respond_to do |format|
      if product.update(product_params)
        format.js 
      else
        format.js 
      end
    end
    
  end

  def create
    product = Product.new(product_params)
    @products_active = Product.where(available: true)
    @products_inactive = Product.where(available: false)
    respond_to do |format|
      if product.save
        format.js 
      else
        format.js
      end
    end
  end
  
  private
   # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:id, :name, :description, :price, :available, :category_id, :model_product_id, :sku, :front, galery: [])
  end
  
end
