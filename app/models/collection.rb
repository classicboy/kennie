class Collection < ActiveRecord::Base
  belongs_to :user

  has_many :product_collections
  has_many :products, through: :product_collections
end
