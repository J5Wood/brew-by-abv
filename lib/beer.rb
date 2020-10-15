class Beer
    attr_accessor :recipe
    attr_reader :name, :abv, :abv_list, :tagline, :description

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, abv, tagline, description)
        @name = name
        @abv = abv
        @tagline = tagline
        @description = description
        if @abv < 6.9
            @abv_list = 1
        elsif @abv > 10
            @abv_list = 3
        else
            @abv_list = 2
        end
        @@all << self
    end

    def self.create_beers        
        beers = API.get_beers
        beers.each do |beer|
            new_beer = self.new(beer["name"], beer["abv"], beer["tagline"], beer["description"])
            new_beer.recipe = Recipe.new(beer["ingredients"], beer["method"], beer["boil_volume"], beer["volume"], beer["brewers_tips"])
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
        self.all.each do |beer|
            if beer.abv_list == abv_selection.to_i
                puts""
                puts "  #{counter}. #{beer.name}, #{beer.abv}%, #{beer.tagline}" 
                counter += 1
            end
        end
    end

    def self.count_beers(abv_selection)
        self.list_beers(abv_selection).length
    end

end
