class ProductsController < ApplicationController

  def index
    @categories = Category.all
    if params[:view] == "discounted"
      @products = Product.get_discounted
    elsif params[:view] == "order_by_price"
      @products = Product.order(:price)
    elsif params[:view] == "order_by_desc"
      @products = Product.order(price: :desc)
    elsif params[:category]
      @products = Category.find_by(name: params[:category]).products
    else
      @products = Product.all
    end
  end


  def new
    @product = Product.new
  end

  def create
    name = params[:name]
    price = params[:price]
    description = params[:description]
    image = params[:image]
    product = Product.new(name: name, price: price, description: description,image: image)
    if @product.save
      flash[:success] = "Product Created"
      redirect_to "/products/#{product.id}"
    else
      flash[:danger] = "Failed."
      render :new
    end


    def show
      @carted_product = CartedProduct.new
      id = params[:id]
      @product = Product.find_by(id: id)
    end

    def edit
      id = params[:id]
      @product = Product.find_by(id: id)
    end

    def update
      id = params[:id]
      product = Product.find_by(id: id)

      id = params[:id]
      name = params[:name]
      price = params[:price]
      image = params[:image]
      description = params[:description]
      product.update(name: name, price: price, image: image, description: description)
      flash[:notice] = "Product Updated"
      redirect_to "/products/#{product.id}"
    end
    

    def destroy
      id = params[:id]
      product = Product.find_by(id: id)
      product.destroy
      flash[:warning] = "Product Deleted"
      redirect_to "/products"
    end

    def search
      search_term = params[:search]
      @products = Product.where("name LIKE ? AND description LIKE ?", "%#{search_term}%", "%#{search_term}%" )
      render :index
    end
  end
#   def add_product
#   end

#   def parameters
#     @message = params[:message]
#     @second_message = params[:second_message]
#   end



#   def number_game
#     secret_number = 99
#     @number = params[:number].to_i
#     if @number > secret_number
#       @message = "too big"
#     elsif @number > secret_number
#       @message = "too small"
#     else
#       @message = "you win"
#     end
#   end

#   def number_input
#   end

#   def segment
  
#   end

#   def form_display
end


