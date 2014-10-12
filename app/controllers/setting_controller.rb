class SettingController < ApplicationController
  def status
    @ingredient_size = Ingredient.select(:id).count
    @recipe_size = Recipe.select(:id).count
    @step_size = Step.select(:id).count
    @report_size = Report.select(:id).count
  end
end
