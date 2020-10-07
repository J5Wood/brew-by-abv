require_relative '../environment'

class Recipe

    # Recipe.new(beer["ingredients"], beer["method"], beer["boil_volume"], beer["volume"], beer["brewers_tips"])
    
    attr_accessor :ingredients, :method, :boil_volume, :volume, :brewers_tips
    

    def initialize(ingredients, method, boil_volume, volume, brewers_tips)
        @ingredients = ingredients
        @method = method
        @boil_volume = boil_volume
        @volume = volume
        @brewers_tips = brewers_tips
    end


    def self.create_recipe(ingredients, method, boil_volume, volume, brewers_tips)
        Recipe.new(ingredients, method, boil_volume, volume, brewers_tips)
    end

end
