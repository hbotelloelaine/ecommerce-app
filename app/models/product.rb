class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  belongs_to :user
  has_many :orders
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  has_many :carted_products
  accepts_nested_attributes_for :images
  

  # validates :name, presence: true
  

  def self.get_discounted
    Product.where("price < ?", 30)
  end
  
  # def price_list
    # price.split(",")
  # end

  # def friendly_created_at
   # ceated_at.strftime("%A, %b %d")
 # end

 def sale_message
  if price.to_i < 30
    "Discount Item!"
  else 
    "On Sale"
  end
end

def show
  if params[:id] = "random"
    @product = Product.all.sample
  else
    @product = Product.find_by(id: params[:id])
  end
end

def tax
  (price * 0.09).round(2)
end

def total
  price + tax
end
end

# def price_asc
  # Product.order(:price)
# end

# def price_desc
  # Product.order(price: :desc)
# end

# def random_product




