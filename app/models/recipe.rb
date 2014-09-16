class Recipe < ActiveRecord::Base
  has_many :ingredients, :class_name => "Ingredient", :primary_key => 'recipe_id', :foreign_key => "recipe_id"
  has_many :steps, :class_name => "Step", :primary_key => 'recipe_id', :foreign_key => "recipe_id"
  has_many :reports, :class_name => "Report", :primary_key => 'recipe_id', :foreign_key => "recipe_id"
end
