class ListController < ApplicationController
  def ingredient
    @ingredient = Ingredient.first(50)
  end

  def ingredient_detail
    @ingredient = Ingredient.where(id: params[:id]).first
    @recipe = @ingredient.recipe
  end

  def recipe
    @recipe = Recipe.first(50)
  end

  def recipe_detail
    @recipe = Recipe.where(id: params[:id]).first
    @ingredients = @recipe.ingredients
    @steps = @recipe.steps
    @reports = @recipe.reports
  end

  def step
    @step = Step.first(50)
  end

  def step_detail
    @step = Step.where(id: params[:id]).first
    @recipe = @step.recipe
  end

  def report
    @report = Report.first(50)
  end

  def report_detail
    @report = Report.where(id: params[:id]).first
    @recipe = @report.recipe
  end
end
