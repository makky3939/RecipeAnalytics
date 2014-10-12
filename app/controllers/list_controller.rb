class ListController < ApplicationController
  def ingredient
    @ingredient = Ingredient.select(:id, :quantity, :recipe_id, :name).page(params[:page]).per(20).order :id
  end

  def ingredient_detail
    @ingredient = Ingredient.where(id: params[:id]).first
    @recipe = @ingredient.recipe
  end

  def recipe
    @recipe = Recipe.select(:id, :name, :preface, :introduce, :peoples).page(params[:page]).per(20).order :id
  end

  def recipe_detail
    @recipe = Recipe.where(id: params[:id]).first
    @ingredients = @recipe.ingredients
    @steps = @recipe.steps
    @reports = @recipe.reports
    natto = Natto::MeCab.new
    @parsed_recipe_name = natto.parse @recipe.name
  end

  def step
    @step = Step.select(:id, :recipe_id, :position, :memo).page(params[:page]).per(20).order :id
  end

  def step_detail
    @step = Step.where(id: params[:id]).first
    @recipe = @step.recipe
  end

  def report
    @report = Report.select(:id, :recipe_id, :user_id, :recommend, :response).page(params[:page]).per(20).order :id
  end

  def report_detail
    @report = Report.where(id: params[:id]).first
    @recipe = @report.recipe
  end
end
