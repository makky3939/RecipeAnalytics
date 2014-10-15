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
      data[:values].push [key, val*2] unless val < 35 || key == 'EOS' || key.size < 2
    end

    render :json => data
  end

  def post_calendar
  end

  def post_calendar_json
    recipes = Recipe.select(:id, :published_at).first(1000000)
    data = {
      recipes: []
    }

    recipes.each do |recipe|
      data[:recipes].push({:date => recipe.published_at.strftime("%Y-%m-%d").split('T')[0]})
    end

    render :json => data
  end
end
