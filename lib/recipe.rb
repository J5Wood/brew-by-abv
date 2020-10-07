require_relative '../environment'

class Recipe
  
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

    def list_recipe
        puts ""
        puts ""
        puts "Initial boil volume is #{self.boil_volume["value"]} #{self.boil_volume["unit"]}, and will reduce to #{self.volume["value"]} #{self.volume["unit"]}."
        puts ""
        puts ""
        puts "Mash temperature:"
        puts ""
        puts "  #{self.method["mash_temp"][0]["temp"]["value"]}° #{self.method["mash_temp"][0]["temp"]["unit"]}"
        puts ""
        puts "Fermentation tempertature:"
        puts ""
        puts "  #{self.method["fermentation"]["temp"]["value"]}° #{self.method["fermentation"]["temp"]["unit"]}"
        puts ""
        puts ""
        puts "Malts:"
        puts ""
        self.ingredients["malt"].each do |malt|
            puts "  #{malt["name"]} - #{malt["amount"]["value"]} #{malt["amount"]["unit"]}"
            puts ""
        end
        puts ""
        puts "Hops:"
        puts ""
        self.ingredients["hops"].each do |hop|
            puts "  #{hop["name"]} - #{hop["amount"]["value"]} #{hop["amount"]["unit"]}."
            puts "    When to add: #{hop["add"]}"
            puts ""
        end
        puts ""
        puts "Yeast:"
        puts ""
        puts "  #{self.ingredients["yeast"]}"
        puts ""
        puts ""
        puts "Brewers tip:"
        puts ""
        puts "  #{self.brewers_tips}"
        puts ""
        puts ""
    end
end