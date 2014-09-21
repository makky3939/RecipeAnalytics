class Report < ActiveRecord::Base
  has_one :recipe, :class_name => "Recipe", :primary_key => 'recipe_id', :foreign_key => "recipe_id"

  def self.usersRelation
    data = []
    Report.all.each do |report|
      data.push source: report.recipe.user_id, target: report.user_id, type: 'hoge'
    end
    data
  end
end
