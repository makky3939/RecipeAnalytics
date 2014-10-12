class RecipesController < ApplicationController
  def with_frequency
  end

  def with_frequency_json
    recipes = Recipe.withFrequency
    data = {
      fields: ['item', 'size'],
      values: []
    }

    recipes.each do |key, val|
      data[:values].push [key, val * 5] unless val < 1 || key == 'EOS' || key.size < 2
    end

    render :json => data
  end

  def post_calendar
  end

  def post_calendar_json
    recipes = Recipe.first(10)
    data = {
      recipes: []
    }

    recipes.each do |recipe|
      data[:recipes].push({:name => recipe.name, :date => recipe.published_at.strftime("%Y-%m-%d")})
    end

    render :json => data
  end
end
