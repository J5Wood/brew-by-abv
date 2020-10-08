require_relative '../environment'

class Beer

    attr_accessor :name, :abv, :abv_list, :tagline, :recipe, :description

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, abv, tagline, description )
        self.name = name
        self.abv = abv
        self.tagline = tagline
        self.description = description
        if self.abv < 6.9
            self.abv_list = 1
        elsif self.abv > 10
            self.abv_list = 3
        else
            self.abv_list = 2
        end
        @@all << self
    end

    def self.create_beers        
        beers = API.get_beers
        beers.each do |beer|
            new_beer = self.new(beer["name"], beer["abv"], beer["tagline"], beer["description"])
            new_beer.recipe = Recipe.create_recipe(beer["ingredients"], beer["method"], beer["boil_volume"], beer["volume"], beer["brewers_tips"])
         end
    end

    def self.list_beers(abv_selection)
        beer_array = []
        self.all.each do |beer|
            if beer.abv_list == abv_selection.to_i
                beer_array << beer
            end
        end
        beer_array
    end

    def self.print_beers(abv_selection)
        counter = 1
        self.all.each do |x|
            if x.abv_list == abv_selection.to_i
                puts""
                puts "#{counter}. #{x.name}, #{x.abv}%, #{x.tagline}" 
                counter += 1
            end
        end
    end

    def self.count_beers(abv_selection)
        counter = 0
        Beer.all.each do |x|
            if x.abv_list == abv_selection.to_i
                counter += 1
            end
        end
        counter
    end
    
end
