require_relative '../environment'

class CLI

    def start
        puts ""
        puts "Welcome to find by ABV!"
        puts ""
        puts "You can find beers to brew based on the ABV% you're looking for."
        puts ""
        #select beers based on abv, 4-6.9%,7-9.9%,10%+
        API.beers_by_abv
    end

end