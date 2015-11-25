  class OrdersController < ApplicationController
    def create
      products = Product.find_by(id: params[:product_id] )
      quantity = params [:quantity]
      tax = product.tax * [:quantity].to_i
      subtototal = product.price * quantity
      total = tax + subtotal


      order = Order.create(quantity: quantity, user_id: current_user.id, product_id: product.id, subtotal: subtotal, tax: tax, total: total )
      redirect_to 'orders/#{order.id}'
    end
    
    def show
      @order = Order.find_by(id: params[:id])
    
    end
  end
