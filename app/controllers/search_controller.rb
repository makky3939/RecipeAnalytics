class SearchController < ApplicationController
  def recipe
    @RecipeAllSize = Recipe.all.size
  end
end
