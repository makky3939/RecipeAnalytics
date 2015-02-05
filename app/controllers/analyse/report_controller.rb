class Analyse::ReportController < ApplicationController
  def user_relation
  end

  def user_relation_create
    reports = Report.usersRelation
    result = []
    reports.each do |source, targets|
      if targets.keys.length > 50
        targets.each do |target, type|
          if type > 12
            result.push(source: source, target: target, type: type)
          end
        end
      end
    end

    REDIS.set 'report_user_relation', result
    redirect_to :back
  end

  def user_relation_json
    reports = Report.usersRelation
    result = []
    reports.each do |source, targets|
      if targets.keys.length > 50
        targets.each do |target, type|
          if type > 12
            result.push(source: source, target: target, type: type)
          end
        end
      end
    end
    render :json => result.to_json
  end

  def user_relation_csv
    reports = Report.usersRelation
    result = []
    reports.each do |source, targets|
      if targets.keys.length > 50
        targets.each do |target, type|
          if type > 10
            result.push(source: source, target: target, type: type)
          end
        end
      end
    end
    send_data to_csv(result), :filename => "report_user_relation.csv"
  end

  private
  def to_csv(result)
    CSV.generate do |writer|
      result.each do |row|
        writer << [row[:source], row[:target], row[:type]]
      end
    end
  end
end
