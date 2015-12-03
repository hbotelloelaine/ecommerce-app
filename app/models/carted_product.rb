class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :user
  validates :quantity, numericality: true
end

def checkout
end