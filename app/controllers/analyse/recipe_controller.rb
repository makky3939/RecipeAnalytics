class Analyse::RecipeController < ApplicationController
  def name
  end

  def name_create
    natto = Natto::MeCab.new

    result = []
    recipes = Recipe.select(:id, :recipe_id, :title).all
    recipes.each do |recipe|
      surface = []
      natto.parse(recipe.title || '') do |row|
        features = row.feature.split ','
        if row.surface
          if row.surface.size > 1
            if features.first == '名詞' || features.first == '動詞'
              surface.push row.surface
            end
          end
        end
      end
      surface.each_cons(2) do |a, b|
        result.push(source: a, target: b)
      end
    end

    def to_csv(result)
      CSV.generate do |writer|
        result.each do |row|
          writer << [row[:source], row[:target]]
        end
      end
    end

    REDIS.set 'recipe_name', to_csv(result)
    redirect_to :back
  end

  def name_csv
    result = REDIS.get 'recipe_name'
    send_data result, :filename => "recipe_name.csv"
  end
end
