class ProductsController < ApplicationController
  d
  def index
    @categories = Category.all
    if params[:view] == "discounted"
      @product = Product.get_discounted
    elsif params[:view] == "order_by_price"
      @product = Product.order(:price)
    elsif params[:view] == "order_by_desc"
      @product = Product.order(price: :desc)
    elsif params[:category]
      @product = Category.find_by(name: params[:category]).product
    else
      @product = Product.all
    end
  end

def show
      @carted_product = CartedProduct.new
      if params[:id] == "random"
        @product = Product.all.sample
      else 
      @product = Product.find_by(id: params[:id])
    end
  end
end


  def new
  @product = Product.new
  @product.images.bulid
    end

    def create
      @product = Product.new(product_params)
    # name = params[:name]
    # price = params[:price]
    # description = params[:description]
    # image = params[:image]
    # product = Product.new(name: name, price: price, description: description,image: image)
    if @product.save
      flash[:success] = "Product Created"
      redirect_to "/products/#{product.id}"
    else
      render :new
    end
  end


    
    def edit
      @product = Product.find_by(id: params[:id])
    end

    def update
      @product = Product.find_by(id: params[:id])
      @product.update(product_params)
      # id = params[:id]
      # product = Product.find_by(id: id)

      # id = params[:id]
      # name = params[:name]
      # price = params[:price]
      # image = params[:image]
      # description = params[:description]
      # product.update(name: name, price: price, image: image, description: description)
      flash[:success] = "Product Updated"
      redirect_to "/products/#{product.id}"
    end

    
    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      # id = params[:id]
      # product = Product.find_by(id: id)
      # product.destroy
      # flash[:warning] = "Product Deleted"
      # redirect_to "/products"
      redirect_to products_path, notice: "Product Deleted"
    end

    def search
      search_term = params[:search]
      @product = Product.where("name LIKE ? AND description LIKE ?", "%#{search_term}%", "%#{search_term}%" )
      render :index
    end
  
  private

  def product_params
    params.require(:product).permit(:id, :name, :price, :image, :description, :supplier_id, :images_attributes [:id, :image_url])
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


