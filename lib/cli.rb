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
        abv_selection = nil
        Beer.create_beers              #create beer objects, can this be done elsewhere?

        while abv_selection != "exit"       #full exit loop
            puts "Enter number next to desired ABV%, or to quit type 'exit'"
            abv_selection = gets.strip.downcase
            puts ""
            puts "Name, ABV%, Style" 
            puts ""
            
            if abv_selection.to_i == 1                     #abv list selection
                Beer.low_abv.each_with_index do |x, ind|        #low abv list
                    puts ""
                    puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
                end
                puts ""
                puts "To see more details about a beer, enter the corresponding number."
                puts "Hit any key to go back to main menu."
                puts ""
                
                beer_selection = gets.strip.downcase                #get beer desriptions
                selected_beer = Beer.low_abv[beer_selection.to_i - 1]
                puts ""
                puts "#{selected_beer.name}:"
                puts "#{selected_beer.description}"
                puts ""
                puts "Would you like to see recipe for this beer?"
                puts "Type 'yes' or 'no'"
                recipe_selection = gets.strip.downcase          #recipe selection
                if recipe_selection == "yes"
                    recipe = selected_beer.recipe    #add beer recipe
                    puts "#{recipe.list_recipe}"
                    # binding.pry
                elsif recipe_selection == "no"
                    puts "testing"
                end

             


            elsif abv_selection.to_i == 2                           #mid abv list
                Beer.mid_abv.each_with_index do |x, ind|      
                    puts ""
                    puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
                end
                puts ""
                puts "To see more details about a beer, enter the corresponding number."
                puts "Hit any key to go back to menu."
                beer_selection = gets.strip.downcase
                selected_beer = Beer.low_abv[beer_selection.to_i - 1]
                puts "#{selected_beer.name}:"
                puts "#{selected_beer.description}"

            elsif abv_selection.to_i == 3                           #high abv list
                Beer.high_abv.each_with_index do |x, ind|       
                    puts ""
                    puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
                end
                puts ""
                puts "To see more details about a beer, enter the corresponding number."
                puts "Hit any key to go back to menu."
                beer_selection = gets.strip.downcase
                selected_beer = Beer.low_abv[beer_selection.to_i - 1]
                puts "#{selected_beer.name}:"
                puts "#{selected_beer.description}"

            end
        end
        # binding.pry
    end


end