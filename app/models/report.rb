class Report < ActiveRecord::Base
  has_one :recipe, :class_name => "Recipe", :primary_key => 'recipe_id', :foreign_key => "recipe_id"

  def self.usersRelation
    data = {}
    Report.all.each do |report|
      source_uid = report.recipe.user_id
      target_uid = report.user_id
      unless data[source_uid]
        data[source_uid] = {}
      end
      unless data[source_uid][target_uid]
        data[source_uid][target_uid] = 0
      end
      data[source_uid][target_uid] += 1
    end
    data
  end
end
