require 'pg'
require_relative '../models/dish'


(1..10).each do |n|
  create_dish(
    "dish number #{n}", 
    "https://www.bbcgoodfood.com/sites/default/files/recipe-collections/collection-image/2013/05/carrot-cake.jpg"
  )
end
