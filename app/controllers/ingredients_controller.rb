class IngredientsController < ApplicationController
  def par_count
    @data = ''
    # natto = Natto::MeCab.new
    # @natto = natto.parse Ingredient.first.name
    # natto.parse(text) do |n|
    #   puts "#{n.surface}\t#{n.feature}"
    # end
  end

  def par_count_json
    items = {}
    Ingredient.all.each do |item|
      items[item.name] = 0 unless items[item.name]
      items[item.name] += 1
    end
    data =
      {
        "fields"=>["item","size"],
        "values"=>[]
      }
      items.each do |key, val|
        data["values"].push [key, val*10] unless val == 1
      end
      data["values"].shuffle!
    render :json => data
  end
end
