class ProductsController < ApplicationController
  def main
    @products = Product.all
  end

  def get_product
    @product = Product.find(params[:product_id])
    @type = params[:option]

    @variants = Variant.where(product_id: @product.id)
  end

end
