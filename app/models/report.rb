class Report < ActiveRecord::Base
  has_one :recipe, :class_name => "Recipe", :primary_key => 'recipe_id', :foreign_key => "recipe_id"

  def self.usersRelation
    if REDIS.get('report_user_relation_row').nil?
      reports = {}
      Report.includes(:recipe).select(:id, :user_id, :recipe_id).all.each do |report|
        unless report.recipe.nil?
          source_uid = report.recipe.user_id
          target_uid = report.user_id
          
          reports[source_uid] = {} unless reports[source_uid]
          reports[source_uid][target_uid] = 0 unless reports[source_uid][target_uid]
          reports[source_uid][target_uid] += 1
        end
      end
      REDIS.set('report_user_relation_row', reports)
    end
    JSON.parse(REDIS.get('report_user_relation_row'))
  end
end
