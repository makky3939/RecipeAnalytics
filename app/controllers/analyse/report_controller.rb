class Analyse::ReportController < ApplicationController
  def user_relation
  end

  def user_relation_create
    reports = Report.usersRelation
    result = []
    reports.each do |source, targets|
      if targets.keys.length > 50
        targets.each do |target, type|
          # p source
          # p target
          # p type
          if type > 12
            result.push(source: source, target: target, type: type)
          end
        end
      end
    end

    REDIS.set 'report_user_relation', result.to_json
    redirect_to :back
  end

  def user_relation_json
    render :json => REDIS.get('report_user_relation')
  end
end
