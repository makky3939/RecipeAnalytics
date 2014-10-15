class IngredientsController < ApplicationController
  def with_frequency
  end

  def with_frequency_json
    ingredients = Ingredient.withFrequency
    data = {
      fields: ['item', 'size'],
      values: []
    }

    ingredients.each do |key, val|
      data[:values].push [key, val] unless val < 100
    end

    render :json => data
  end
end
