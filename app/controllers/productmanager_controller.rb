class ProductmanagerController < ApplicationController
  def main
    authorize! :main_productmanager, :logs
  end

  def active_products
    authorize! :active_products_productmanager, :logs
    #@products = Product.joins(:variants).where(available: true)
    @products = Product.where(available: true).order(sku: :desc)
  end

  def inactive_products
    authorize! :inactive_products_productmanager, :logs
    @products = Product.where(available: false).order(sku: :desc)
  end

  def get_productmanager
    authorize! :get_productmanager_productmanager, :logs
    @product = Product.find(params[:product_id])
    @type = params[:option]
    @variants = Variant.where(product_id: @product.id)
  end

  def activate
    authorize! :activate_productmanager, :logs
    sleep 2
    product = Product.find(params[:product_id])
    product.available = true
    product.save
    @products = Product.where(available: false).order(sku: :desc)
  end

  def inactivate
    authorize! :inactivate_productmanager, :logs
    sleep 2
    product = Product.find(params[:product_id])
    product.available = false
    product.save
    @products = Product.where(available: true).order(sku: :desc)
  end

  def update
    authorize! :update_productmanager, :logs
    product = Product.find(product_params[:id])
    @products_active = Product.where(available: true).order(sku: :desc)
    @products_inactive = Product.where(available: false).order(sku: :desc)
    respond_to do |format|
      if product.update(product_params)
        format.js
      else
        format.js
      end
    end
  end

  def create
    authorize! :create_productmanager, :logs
    @message = ""
    aux = product_params[:sku].upcase
    @flag = false
    @model = false
    Product.where(sku: aux).length == 0 ? @flag = true : @flag = false
    Product.where(model_product_id: product_params[:model_product_id]).length == 0 ? @model = true : @model = false
    if @flag == true && @model == true
      product = Product.new(product_params)
      product.sku = aux
      @products_active = Product.where(available: true).order(sku: :desc)
      @products_inactive = Product.where(available: false).order(sku: :desc)
      respond_to do |format|
        if product.save
          format.js
        else
          format.js
        end
      end
    elsif @flag == false
      @message = "El SKU que ingreso ya esta en uso"
    elsif @model == false
      @message = "El Modelo que ingreso ya esta en el Sistema"
    end
  end

  def variant_products
    authorize! :variant_products_productmanager, :logs
    @variants = Variant.all
  end
  
  def get_variant_productmanager
    authorize! :get_variant_productmanager_productmanager, :logs
    @variant = Variant.find(params[:variant_id])
    @product = Product.find(@variant.product_id)
    @type = params[:option]
    @variants = Variant.where(product_id: @product.id)
  end

  def create_variant
    authorize! :create_variant_productmanager, :logs
    sleep 2
    @flag = false
    Variant.where(product_id: variant_params[:product_id] , size_product_id: variant_params[:size_product_id]).length == 0 ? @flag = false : @flag = true
    if @flag == true
      @message = "Ya existe la Variante de este Producto que esta creando"
    else
      variant = Variant.create(variant_params)
      variant.save
      @products_active = Product.where(available: true).order(sku: :desc)
      @products_inactive = Product.where(available: false).order(sku: :desc)
      @variants = Variant.all
    end
  end

  def update_variant
    authorize! :update_variant_productmanager, :logs
    variant = Variant.find(variant_params[:id])
    @products_active = Product.where(available: true).order(sku: :desc)
    @products_inactive = Product.where(available: false).order(sku: :desc)
    @variants = Variant.all
    respond_to do |format|
      if variant.update(variant_params)
        format.js
      else
        format.js
      end
    end
  end

  def search_inactive
    authorize! :search_inactive_productmanager, :logs
    respond_to do |format|
      if params[:search]
        @products = Product.where(available: false).where('sku LIKE ?', "%#{params[:search]}%").order(sku: :desc)
        format.js
      else
        @products = Product.where(available: false).order(sku: :desc)
        format.js
      end
    end
  end

  def search_active
    authorize! :search_active_productmanager, :logs
    respond_to do |format|
      if params[:search]
        @products = Product.where(available: true).where('sku LIKE ?', "%#{params[:search]}%").order(sku: :desc)
        format.js
      else
        @products = Product.where(available: true).order(sku: :desc)
        format.js
      end
    end
  end

  def search_variant
    authorize! :search_variant_productmanager, :logs
    respond_to do |format|
      if params[:search].length
        @variants = Variant.joins(:product).where('products.sku like ?', "%#{params[:search]}%").order(sku: :desc)
        format.js
      else
        @variants = Variant.joins(:product).all.order(sku: :desc)
        format.js
      end
    end
  end

  private
  def product_params
    params.require(:product).permit(:id, :name, :description, :price, :available, :category_id, :model_product_id, :sku, :front, galery: [])
  end

  def variant_params
    params.require(:variant).permit(:id, :product_id, :stock, :size_product_id)
  end
end
