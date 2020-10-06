require_relative '../environment'

class BeerList

    @@low_abv = []
    @@mid_abv = []
    @@high_abv = []

    def self.beers_by_abv
        beers = API.get_beers
        beers.each do |beer|
            if beer["abv"].between?(4,6.9)
                @@low_abv << beer
            elsif beer["abv"].between?(7,9.9)
                @@mid_abv << beer
            else
                @@high_abv << beer
            end
        end
    end

    def self.low_abv
        @@low_abv
    end

    def self.mid_abv
        @@mid_abv
    end

    def self.high_abv
        @@high_abv
    end

end