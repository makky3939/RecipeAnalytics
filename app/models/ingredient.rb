class Ingredient < ActiveRecord::Base
  has_one :recipe, :class_name => "Recipe", :primary_key => 'recipe_id', :foreign_key => "recipe_id"

  def self.withFrequency
    ingredients = {}
    Ingredient.select(:name).all.each do |item|
      if ingredients[item.name]
        ingredients[item.name] += 0.01
      else
        ingredients[item.name] = 0.00
      end
    end
    ingredients
  end
end
