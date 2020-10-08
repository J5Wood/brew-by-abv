require_relative '../environment'

class Beer

    attr_accessor :name, :abv, :abv_list, :tagline, :recipe, :description

    @@all = []
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
            self.abv_list = 2
        else
            self.abv_list = 3
        end
        @@all << self
        # if self.abv < 6.9
        #     @@low_abv << self
        # elsif self.abv > 10
        #     @@high_abv << self
        # else
        #     @@mid_abv << self
        # end
    end

    def self.create_beers        
        beers = API.get_beers
        beers.each do |beer|
            new_beer = Beer.new(beer["name"], beer["abv"], beer["tagline"], beer["description"])
            new_beer.recipe = Recipe.create_recipe(beer["ingredients"], beer["method"], beer["boil_volume"], beer["volume"], beer["brewers_tips"])
         end
    end

    def self.list_beers(abv_selection)
        counter = 1
        Beer.all.each do |x|
            if x.abv_list == abv_selection.to_i
                puts""
                puts "#{counter}. #{x.name}, #{x.abv}%, #{x.tagline}" 
                counter += 1
            end
        end
    end

    def self.list_low_abv
        self.low_abv.each_with_index do |x, ind|        #print low abv beer list
            puts ""
            puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
        end
    end

    def self.list_mid_abv
        self.mid_abv.each_with_index do |x, ind|        #print mid abv beer list
            puts ""
            puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
        end
    end
    
    def self.list_high_abv
        self.high_abv.each_with_index do |x, ind|        #print high abv beer list
            puts ""
            puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
        end
    end

end
