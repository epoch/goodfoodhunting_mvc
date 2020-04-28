require 'pg'
require_relative '../models/dish'
require_relative '../models/user'


# create dummy user
create_user('dt@ga.co', 'pudding')
user = find_one_user_by_email('dt@ga.co')

# create 10 dummy dish
(1..10).each do |n|
  create_dish(
    "dish number #{n}", 
    "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/carrot-cake.jpg",
    user["id"]
  )
end
