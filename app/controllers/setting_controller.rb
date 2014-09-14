class SettingController < ApplicationController
  def status
    @ingredient_size = Ingredient.all.size
    @recipe_size = Recipe.all.size
    @step_size = Step.all.size
    @report_size = Report.all.size
  end
end
