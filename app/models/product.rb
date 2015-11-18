class Product < ActiveRecord::Base

  def self.get_discounted
    Product.where("price < ?", 12)
  
  def price_list
   price.split(",")
end

def friendly_created_at
   ceated_at.strftime("%A, %b %d")
end

def sale_message
  if price < 12
    "Discount Item!"
  else 
    "On Sale"
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end

