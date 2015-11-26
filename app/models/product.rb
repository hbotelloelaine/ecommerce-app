class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  belongs_to :user
  has_many :orders

  def self.get_discounted
    Product.where("price < ?", 12)
  end
  
  def price_list
    price.split(",")
  end

  def friendly_created_at
     ceated_at.strftime("%A, %b %d")
  end

  def sale_message
    if price.to_i < 12
      "Discount Item!"
    else 
      "On Sale"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def price_asc
    Product.order(:price)
  end

  def price_desc
    Product.order(price: :desc)
  end

  def random_product
  end


end


