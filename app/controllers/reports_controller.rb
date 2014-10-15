class ReportsController < ApplicationController
  def users_relation
  end

  def users_relation_json
    reports = Report.usersRelation
    data = []
    reports.each do |source, targets|
      if targets.keys.length > 50
        targets.each do |target, type|
          data.push(source: source, target: target, type: type)
        end
      end
    end
    render :json => data
  end
end
