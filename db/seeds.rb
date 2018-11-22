# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
open_url = open(url).read
parse = JSON.parse(open_url)
ingredients = parse["drinks"]
ingredients.each do |ingredient|
  ingredient_to_save = Ingredient.new(name: ingredient["strIngredient1"])
  ingredient_to_save.save!
end
