class Ingredient < ActiveRecord::Base
  has_one :recipe, :class_name => "Recipe", :primary_key => 'recipe_id', :foreign_key => "recipe_id"

  def self.withFrequency
    ingredients = {}
    Ingredient.all.each do |item|
      if ingredients[item.name]
        ingredients[item.name] += 1
      else
        ingredients[item.name] = 0
      end
    end
    ingredients
  end
end
