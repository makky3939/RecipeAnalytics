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
    recipe_id: row[0].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    name: row[1].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    quantity: row[2].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => "")
  )
  print "\rLine ##{$.} "
end
puts 'done!'

puts 'Creating the recipe table'
CSV.foreach('db/rakuten_recipe/recipes.csv') do |row|
  Recipe.create(
    recipe_id: row[0].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    user_id: row[1].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    large_category: row[2].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    medium_category: row[3].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    small_category: row[4].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    title: row[5].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    preface: row[6].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    introduce: row[7].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    img_name: row[8].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    name: row[9].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    tag1: row[10].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    tag2: row[11].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    tag3: row[12].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    tag4: row[13].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    one_point: row[14].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    cooktime_id: row[15].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    anytime_id: row[16].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    money_id: row[17].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    peoples: row[18].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    published_at: row[19].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => "")
  )
  print "\rLine ##{$.} "
end
puts 'done!'

puts 'Creating the step table'
CSV.foreach('db/rakuten_recipe/steps.csv') do |row|
  Step.create(
    recipe_id: row[0].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    position: row[1].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    memo: row[2].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => "")
  )
  print "\rLine ##{$.} "
end
puts 'done!'

puts 'Creating the tsukurepo table'
CSV.foreach('db/rakuten_recipe/tsukurepos.csv') do |row|
  Report.create(
    recipe_id: row[0].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    user_id: row[1].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    recommend: row[2].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    response: row[3].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => ""),
    posted_at: row[4].gsub(/\"|\,|\r|\n/, '\"' => "", '\,' => "、", "\r" => "", "\n" => "")
  )
  print "\rLine ##{$.} "
end
puts 'done!'