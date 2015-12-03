class CartedProductsController < ApplicationController

  def index
    if current_user && current_user.carted_products.where(status: "carted").any?
    @carted_products = current_user.carted_products.where(status: "carted")
    @subtotal = calculate_subtotal(@carted_products)
    @tax = calculate_subtotal(@carted_products)
    @total = @subtotal + @tax
  else 
    redirect_to "/"
  end


  def create
    @product = Product.find_by(id: params[:params_id])
    quantity = params[:quantity]
    @carted_product = CartedProduct.new(user_id: user_id, product_id: product_id, quantity: quantity, status: "carted") 
    if @carted_product.save
      flash[:success] = "#{quantity} #{@product.name}(s) added to your cart!"
      redirect_to "/"
    else
      render template: "products/show"
    end
  end


  



  #   def new
  #     @carted_products = CartedProduct.all
  #   end

  # end
