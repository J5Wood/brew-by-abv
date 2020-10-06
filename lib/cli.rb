require_relative '../environment'

class CLI

    def start
        puts ""
        puts "Welcome to find by ABV!"
        puts ""
        puts "You can find beers to brew based on the ABV% you're looking for."
        puts ""
        puts "1. 4% - 6.9% ABV"
        puts "2. 7% - 9.9% ABV"
        puts "3. 10% and up ABV"
        puts ""
        puts "Enter number next to desired ABV%, or type 'exit'"
        abv_selection = gets.strip.downcase
        API.beers_by_abv
        if abv_selection.to_i == 1
            API.low_abv.each_with_index do |x, ind|
                puts ""
                puts "#{ind + 1}. #{x["name"]}"
            end
        elsif abv_selection.to_i == 2
            API.mid_abv.each_with_index do |x, ind|
                puts ""
                puts "#{ind + 1}. #{x["name"]}"
            end
        elsif abv_selection.to_i == 3
            API.high_abv.each_with_index do |x, ind|
                puts ""
                puts "#{ind + 1}. #{x["name"]}"
            end
        elsif abv_selection == "exit"
            
        end
        binding.pry
    end


end