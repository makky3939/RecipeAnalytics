class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.string :large_category, limit: 255
      t.string :medium_category, limit: 255
      t.string :small_category, limit: 255
      t.string :title, limit: 255
      t.string :preface
      t.string :introduce
      t.string :img_name, limit: 255
      t.string :name, limit: 255
      t.string :tag1, limit: 255
      t.string :tag2, limit: 255
      t.string :tag3, limit: 255
      t.string :tag4, limit: 255
      t.string :one_point
      t.integer :cooktime_id
      t.string :anytime_id, limit: 255
      t.integer :money_id
      t.string :peoples, limit: 255
      t.datetime :published_at
      t.timestamps
    end
  end
end
