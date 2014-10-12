class AddIndex2 < ActiveRecord::Migration
  def change
  end
  add_index "ingredients", ["recipe_id"], :name => "index_ingredients_on_recipe_id"
  add_index "recipes", ["recipe_id"], :name => "index_recipes_on_recipe_id"
  add_index "recipes", ["user_id"], :name => "index_recipes_on_user_id"
  add_index "steps", ["recipe_id"], :name => "index_steps_on_recipe_id"
  add_index "reports", ["recipe_id"], :name => "index_reports_on_recipe_id"
  add_index "reports", ["user_id"], :name => "index_reports_on_user_id"
end
