require_relative '../environment'

class Beer

    attr_accessor :name, :abv, :tagline, :recipe, :description

    @@low_abv = []
    @@mid_abv = []
    @@high_abv = []

    def self.low_abv
        @@low_abv
    end

    def self.mid_abv
        @@mid_abv
    end

    def self.high_abv
        @@high_abv
    end

    def initialize(name, abv, tagline, description )
        self.name = name
        self.abv = abv
        self.tagline = tagline
        self.description = description
        if self.abv < 6.9
            @@low_abv << self
        elsif self.abv > 10
            @@high_abv << self
        else
            @@mid_abv << self
        end
    end

    def self.create_beers        
        beers = API.get_beers
        beers.each do |beer|
            new_beer = Beer.new(beer["name"], beer["abv"], beer["tagline"], beer["description"])
            new_beer.recipe = Recipe.create_recipe(beer["ingredients"], beer["method"], beer["boil_volume"], beer["volume"], beer["brewers_tips"])
         end
    end

    

end
