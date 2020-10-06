require_relative '../environment'

class Beer

    attr_accessor :name, :abv, :tagline, :recipe

                                #make beers objects, 

    @@all = []


    def self.all
        @@all
    end

    def initialize(name, abv, tagline, recipe = nil)
        self.name = name
        self.abv = abv
        self.tagline = tagline
        self.recipe = recipe
        @@all << self
    end

    def self.create_beers        
        beers = API.get_beers
        beers.each do |beer|
            beer = Beer.new(beer["name"],beer["abv"],beer["tagline"])
            # beer.recipe = Recipe.new(ingredients)
        end
    end



            # if beer["abv"].between?(4,6.9)
            #     binding.pry
            #     self.new
            #     beer.abv_list = "low"
            #     @@all << beer
            # elsif beer["abv"].between?(7,9.9)
                
            #     beer.abv_list = "mid"
            #     @@all << beer
            # else
            #     beer.abv_list = "high"
            #     @@all << beer
            # end
    #     end
    # end

    # def self.low_abv
    #     @@low_abv
    # end

    # def self.mid_abv
    #     @@mid_abv
    # end

    # def self.high_abv
    #     @@high_abv
    # end
binding.pry
end

binding.pry