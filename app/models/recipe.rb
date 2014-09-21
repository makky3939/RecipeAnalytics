class Recipe < ActiveRecord::Base
  has_many :ingredients, :class_name => "Ingredient", :primary_key => 'recipe_id', :foreign_key => "recipe_id"
  has_many :steps, :class_name => "Step", :primary_key => 'recipe_id', :foreign_key => "recipe_id"
  has_many :reports, :class_name => "Report", :primary_key => 'recipe_id', :foreign_key => "recipe_id"

  def self.withFrequency
    natto = Natto::MeCab.new
    recipes = {}

    Recipe.all.each do |item|
      parsed_item_names = natto.parse item.name
      parsed_item_names = parsed_item_names.split("\n")
      parsed_item_names.each do |name|
        name = name.split "\t"
        if recipes[name[0]]
          recipes[name[0]] += 1
        else
          recipes[name[0]] = 0
        end
      end
    end
    recipes
  end
end
