class ChangeColumnRecipe < ActiveRecord::Migration
  def change
    change_column :recipes, :published_at, :string
  end
end
