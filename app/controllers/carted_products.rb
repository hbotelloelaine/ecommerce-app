class CartedProductsController < ApplicationController

  def index
    if current_user && current_user.carted_product.where(status: "carted").any?
    @carted_product = current_user.carted_product.where(status: "carted")
    @subtotal = calculate_subtotal(@carted_product)
    @tax = calculate_subtotal(@carted_product)
    @total = @subtotal + @tax
  else 
    redirect_to "/"
  end


  def create
    @product = Product.find_by(id: params[:params_id])
    quantity = params[:quantity]
    @carted_product = CartedProduct.new(quantity: quantity, product_id: @product_id, status: "carted", user_id: current_user.id) 
    if @carted_product.save
      session[:cart_count] += 1
      flash[:success] = "#{quantity} #{@product.name}(s) added to your cart!"
      redirect_to "/"
    else
      render template: "products/show"
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status ="removed"
    if carted_product.save
      session[:cart_count] -= 1
      flash[:warning] = "#{carted_product.quantity} #{carted_product.product.name}(s) removed from cart."
    else
      flash[:danger] = "Product not removed from cart!"
    end
    redirect_to "/carted_products"
  end

end


  



  #   def new
  #     @carted_products = CartedProduct.all
  #   end

  # end
