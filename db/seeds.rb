# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


## PRODUCT

#  id         :integer          not null, primary key
#  name       :string
#  about      :text
#  price      :integer
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

product_info = [
    {
        name: "Kiwi soda",
        about: "Drinks, Coffee",
        price: "80000",
        image: "https://scontent-sit4-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/12744348_1040615032675844_5539868103589300116_n.jpg?oh=7e1775243afff578ecd1e30330581a3a&oe=578BBEB3"
    },
    {
        name: "Cookie",
        about: "Chocolate",
        price: "20000",
        image: "https://scontent-sit4-1.xx.fbcdn.net/hphotos-xft1/v/t1.0-9/12744348_1040615032675844_5539868103589300116_n.jpg?oh=7e1775243afff578ecd1e30330581a3a&oe=578BBEB3"
    }
]

product_info.each do |product|
  Product.create(name: product[:name], about: product[:about], image: product[:image], price: product[:price])
end


categories = ["Coffee", "Drink"]

categories.each do |c|
  category = Category.create(name: c)
  offset = rand(Product.count)
  random_product = Product.offset(offset).first
  category.products << random_product
end