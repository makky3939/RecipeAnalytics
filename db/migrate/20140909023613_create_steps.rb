class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :recipe_id
      t.integer :position
      t.string :memo
      t.timestamps
    end
  end
end
