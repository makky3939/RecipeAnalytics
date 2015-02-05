class Analyse::MethodController < ApplicationController
  def of_ingredients
  end

  def of_ingredients_create
    _verb = Recipe.verb_of_title
    verb = {}
    _verb.each do |key, val|
      if val.size > 1000
        Ingredient.select(:id, :name).where(recipe_id: val).each do |ingredient|
          verb[key] = {} if verb[key].nil?
          if verb[key][ingredient.name].nil?
            verb[key][ingredient.name] = 1
          else
            verb[key][ingredient.name] += 1
          end
        end
      end
    end

    result = []
    verb.each do |v, item|
      item.each do |name, count|
        if count > 20
          result.push(source: v, target: name, type: count)
        end
      end
    end
    REDIS.set 'method_of_ingredients', result.to_json
    redirect_to :back
  end

  def of_ingredients_json
    render :json => REDIS.get('method_of_ingredients')
  end

  def of_ingredients_csv
    _verb = Recipe.verb_of_title
    verb = {}
    _verb.each do |key, val|
      if val.size > 1000
        Ingredient.select(:id, :name).where(recipe_id: val).each do |ingredient|
          verb[key] = {} if verb[key].nil?
          if verb[key][ingredient.name].nil?
            verb[key][ingredient.name] = 1
          else
            verb[key][ingredient.name] += 1
          end
        end
      end
    end

    result = []
    verb.each do |v, item|
      item.each do |name, count|
        if count > 10
          result.push(source: v, target: name, type: count)
        end
      end
    end

    def to_csv(result)
      CSV.generate do |writer|
        result.each do |row|
          writer << [row[:source], row[:target], row[:type]]
        end
      end
    end

    send_data to_csv(result), :filename => "method_of_ingredients.csv"
  end
end
