# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  about      :text
#  price      :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ActiveRecord::Base
  searchkick match: :word_start, searchable: [:name]

  has_many :products_categories
  has_many :categories, through: :products_categories

  enum is_new: [:new_arrival, :best_seller]

  has_many :product_collections
  has_many :collections, through: :product_collections

  has_many :order_products
  has_many :orders, through: :order_products

  has_many :reviews
end
