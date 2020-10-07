require_relative '../environment'

class API


    def self.get_beers
        uri = URI("https://api.punkapi.com/v2/beers")
        response = Net::HTTP.get(uri)
        beers = JSON.parse(response)
    end

    
end