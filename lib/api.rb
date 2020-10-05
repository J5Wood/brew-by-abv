require_relative '../environment'

class API

    attr_accessor :low_abv, :mid_abv, :high_abv

    def self.beers_by_abv
        beers = self.get_beers
        @low_abv = []
        @mid_abv = []
        @high_abv = []
        beers.each do |beer|
            if beer["abv"].between?(4,6.9)
                @low_abv << beer
            elsif beer["abv"].between?(7,9.9)
                @mid_abv << beer
            else
                @high_abv << beer
            end
        end
        binding.pry
    end

    def self.get_beers
        uri = URI("https://api.punkapi.com/v2/beers")
        response = Net::HTTP.get(uri)
        beers = JSON.parse(response)
    end

end