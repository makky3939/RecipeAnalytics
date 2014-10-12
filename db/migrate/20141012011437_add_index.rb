class AddIndex < ActiveRecord::Migration
  def change
  end
  add_index "ingredients", ["id"], :name => "index_ingredients_on_id"
  add_index "recipes", ["id"], :name => "index_recipes_on_id"
  add_index "steps", ["id"], :name => "index_steps_on_id"
  add_index "reports", ["id"], :name => "index_reports_on_id"
end
