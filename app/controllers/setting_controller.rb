class SettingController < ApplicationController
  def status
    unless REDIS.get 'ingredient_size'
      REDIS.set 'ingredient_size', Ingredient.select(:id).count
    end

    unless REDIS.get 'recipe_size'
      REDIS.set 'recipe_size', Recipe.select(:id).count
    end

    unless REDIS.get 'step_size'
      REDIS.set 'step_size', Step.select(:id).count
    end

    unless REDIS.get 'report_size'
      REDIS.set 'report_size', Report.select(:id).count
    end

    @ingredient_size = REDIS.get 'ingredient_size'
    @recipe_size = REDIS.get 'recipe_size'
    @step_size = REDIS.get 'step_size'
    @report_size = REDIS.get 'report_size'
  end
end
