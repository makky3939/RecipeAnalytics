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
      data[:values].push [key, val * 10] unless val < 1
    end

    render :json => data
  end
end
