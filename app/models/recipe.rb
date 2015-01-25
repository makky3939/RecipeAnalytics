class Recipe < ActiveRecord::Base
  has_many :ingredients, :class_name => "Ingredient", :primary_key => 'recipe_id', :foreign_key => "recipe_id"
  has_many :steps, :class_name => "Step", :primary_key => 'recipe_id', :foreign_key => "recipe_id"
  has_many :reports, :class_name => "Report", :primary_key => 'recipe_id', :foreign_key => "recipe_id"

  def self.withFrequency
    natto = Natto::MeCab.new
    recipes = {}

    Recipe.all.each do |item|
      unless item.name.nil?
        parsed_item_names = natto.parse item.name
        parsed_item_names = parsed_item_names.split("\n")
        parsed_item_names.each do |name|
          name = name.split "\t"
          if recipes[name[0]]
            recipes[name[0]] += 0.01
          else
            recipes[name[0]] = 0.0
          end
        end
      end
    end
    recipes
  end

  def self.verb_of_title
    if REDIS.get('recipe_verb_of_title').nil?
      natto = Natto::MeCab.new
      surface = []
      recipes = Recipe.select(:id, :recipe_id, :title).all
      recipes.each do |recipe|
        natto.parse(recipe.title || '') do |row|
          features = row.feature.split ','
          if features.first == '動詞' && row.surface.size > 1
            surface.push [row.surface, recipe.recipe_id]
          end
        end
      end

      result = {}
      surface.each do |word, val|
        if result[word]
          result[word].push val
        else
          result[word] = [val]
        end
      end
      REDIS.set('recipe_verb_of_title', result.to_json)
    end
    JSON.parse(REDIS.get('recipe_verb_of_title'))
  end
end
