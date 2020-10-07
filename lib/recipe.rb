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

    def list_recipe
        puts ""
        puts "Initial boil volume is #{self.boil_volume["value"]} #{self.boil_volume["unit"]}, and will reduce to #{self.volume["value"]} #{self.volume["unit"]}."
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
        puts "#{self.brewers_tips}"
    end
end
