  class OrdersController < ApplicationController
    before_action :athenticate_user!

    def create
      to_buy_products = current_user.carted_products.where(status: "carted")
      subtotal = calculate_subtotal(to_but_products)
      tax = calculate_tax(to_buy_products)
      total = subtotal + tax
      @order = Order.new(user_id: current_user.id, subtotal: subtotal, tax: tax, total: total)
      if @order.save
        session[:cart_count] = nil
        to_buy_product.update_all(staus: "Purchased", order_id: @order_id)
        redirect_to "/orders/#{@order.id}"
      else
        render template: "carted_products/index"
      end
    end
    
    def show
      @order = Order.find_by(id: params[:id])
    end
  end

