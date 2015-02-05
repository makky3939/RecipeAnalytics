class Analyse::IngredientController < ApplicationController
  def quantity
  end

  def quantity_create
    Ingredient.select(:id, :name)
    REDIS.set 'ingredient_quantity', result
    redirect_to :back
  end
end
