class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.string :recommend
      t.string :response
      t.datetime :posted_at
      t.timestamps
    end
  end
end
