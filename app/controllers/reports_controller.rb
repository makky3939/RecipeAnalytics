class ReportsController < ApplicationController
  def users_relation
  end

  def users_relation_json
    reports = Report.usersRelation
    data = reports
    render :json => data
  end
end
