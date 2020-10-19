class Recipe
  
    attr_reader :ingredients, :method, :boil_volume, :volume, :brewers_tips

    def initialize(ingredients, method, boil_volume, volume, brewers_tips)
        @ingredients = ingredients
        @method = method
        @boil_volume = boil_volume
        @volume = volume
        @brewers_tips = brewers_tips
    end

end