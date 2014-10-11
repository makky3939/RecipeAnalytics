class Report < ActiveRecord::Base
  has_one :recipe, :class_name => "Recipe", :primary_key => 'recipe_id', :foreign_key => "recipe_id"

  def self.usersRelation
    data = {}
    Report.includes(:recipe).first(1000).each do |report|
      unless report.recipe.nil?
        source_uid = report.recipe.user_id
        target_uid = report.user_id
        
        data[source_uid] = {} unless data[source_uid]
        data[source_uid][target_uid] = 0 unless data[source_uid][target_uid]
        data[source_uid][target_uid] += 1
      end
    end
    data
  end
end
