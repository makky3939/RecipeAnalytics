class Analyse::MethodController < ApplicationController
  def of_ingredients
    stop_word = []
    natto = Natto::MeCab.new
    recipes = Recipe.first(10000)

    result = []

    recipes.each do |recipe|
      natto.parse(recipe.title) do |row|
        unless stop_word.include? row.surface
          features = row.feature.split ','
          if features.first == '名詞' && row.surface.size > 1
            result.push row.surface
          end
        end
      end
    end

    REDIS.set 'method_of_ingredients', result.uniq!.to_json
    redirect_to :back
  end

  def of_ingredients_json
    
  end
end
