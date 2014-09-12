class SearchController < ApplicationController
  def status
    @RecipeSize = Recipe.all.size
    @IngredientSize = Ingredient.all.size
    @StepSize = Step.all.size
    @ReportSize = Report.all.size
  end
end
