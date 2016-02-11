class Order < ActiveRecord::Base
  belongs_to :products
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  validates :user,  :product, presence: true
  
end


def quantity_must_be_6
  if quantity != 6
    errors.add(:quantity, "Only input 6!")
  end
end
end