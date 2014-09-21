class IngredientsController < ApplicationController
  def par_count
  end

  def par_count_json
    ingredients = Ingredient.withFrequency
    data = {
      fields: ['item', 'size'],
      values: []
    }

    ingredients.each do |key, val|
      data[:values].push [key, val * 10] unless val == 1
    end

    render :json => data
  end
end
