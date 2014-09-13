class ListController < ApplicationController
  def ingredient
    @ingredient = Ingredient.first(20)
  end

  def recipe
    @recipe = Recipe.first(20)
  end

  def step
    @step = Step.first(20)
  end

  def report
    @report = Report.first(20)
  end
end
