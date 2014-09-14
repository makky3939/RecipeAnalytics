class ListController < ApplicationController
  def ingredient
    @ingredient = Ingredient.first(50)
  end

  def recipe
    @recipe = Recipe.first(50)
  end

  def recipe_detail
    @recipe = Recipe.where(id: params[:id]).first
    puts '@@@@@@@@'
    puts '@@@@@@@@'
    puts '@@@@@@@@'
    puts '@@@@@@@@'
    puts '@@@@@@@@'
    p @recipe
  end

  def step
    @step = Step.first(50)
  end

  def report
    @report = Report.first(50)
  end
end
