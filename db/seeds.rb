# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

puts 'Tables drop'
Ingredient.delete_all
Recipe.delete_all
Step.delete_all
Report.delete_all
puts 'done!'

puts 'Creating the ingredient table'
CSV.foreach('db/rakuten_recipe/ingredients.csv') do |row|
  Ingredient.create(
    name: row[0],
    quantity: row[1],
    recipe_id: row[2]
  )
  print "\rLine ##{$.}"
end
puts 'done!'

puts 'Creating the recipe table'
CSV.foreach('db/rakuten_recipe/recipes.csv') do |row|
  Recipe.create(
    recipe_id: row[0],
    user_id: row[1],
    large_category: row[2],
    medium_category: row[3],
    small_category: row[4],
    title: row[5],
    preface: row[6],
    introduce: row[7],
    img_name: row[8],
    name: row[9],
    tag1: row[10],
    tag2: row[11],
    tag3: row[12],
    tag4: row[13],
    one_point: row[14],
    cooktime_id: row[15],
    anytime_id: row[16],
    money_id: row[17],
    peoples: row[18],
    published_at: row[19]
  )
  print "\rLine ##{$.}"
end
puts 'done!'

puts 'Creating the step table'
CSV.foreach('db/rakuten_recipe/steps.csv') do |row|
  Step.create(
    position: row[0],
    memo: row[1],
    recipe_id: row[2]
  )
  print "\rLine ##{$.}"
end
puts 'done!'

puts 'Creating the tsukurepo table'
CSV.foreach('db/rakuten_recipe/tsukurepos.csv') do |row|
  Report.create(
    posted_at: row[0],
    recipe_id: row[1],
    recommend: row[2],
    response: row[3],
    user_id: row[4]
  )
  print "\rLine ##{$.}"
end
puts 'done!'