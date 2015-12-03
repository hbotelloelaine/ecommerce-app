class Order < ActiveRecord::Base
  belongs_to :products
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :user,  :product, presence: true
  
end
