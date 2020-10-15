class CLI

    def prompt
        gets.strip.downcase
    end

    def start
        Beer.create_beers              #create beer objects
        binding.pry
        puts ""
        puts "-----Welcome to Brew By ABV!-----"
        puts ""
        puts "You can find beers to brew based on the ABV% you're looking for."
        abv_selection = nil
        while abv_selection != "exit"       #full exit loop
            puts ""
            puts "  1. 4% - 6.9% ABV"
            puts ""
            puts "  2. 7% - 9.9% ABV"
            puts ""
            puts "  3. 10% and up ABV"
            puts ""
            puts "Enter number next to desired ABV%, or to quit type 'exit'" 
            puts ""
            abv_selection = self.prompt         #enter abv% selection

            if (1..3).include?(abv_selection.to_i)                  #selection validity check
                beer_selection = nil
                while beer_selection != "back"
                    puts ""
                    puts "  Name, ABV%, Style" 
                    puts ""
                    Beer.print_beers(abv_selection)
                    puts ""
                    puts "To see more details about a beer, enter the corresponding number."
                    puts "Type 'back' to return to the main menu."
                    puts ""
                    beer_selection = self.prompt                            #select which beer to view description of

                    if (1..Beer.count_beers(abv_selection)).include?(beer_selection.to_i)       #check if beer selection is valid number
                        recipe_selection = nil
                        while recipe_selection != "back"
                            selected_beer = Beer.list_beers(abv_selection)[beer_selection.to_i - 1]   #sets selected beer 
                            puts ""
                            puts "  #{selected_beer.name}:"
                            puts ""
                            puts "  #{selected_beer.description}"
                            puts ""
                            puts "Would you like to see recipe for this beer?"
                            puts "Type 'yes' to view recipe, or 'back' to go back."
                            puts ""

                            recipe_selection = self.prompt          #get recipe description
                            if recipe_selection == "yes"
                                puts "#{selected_beer.recipe.list_recipe}"
                                puts ""
                                while recipe_selection != "back"
                                    puts ""
                                    puts "type back to return to beer selection"
                                    puts ""
                                    recipe_selection = self.prompt
                                end
                            else
                                puts ""
                                puts "Invalid selection"
                            end
                        end
                    elsif beer_selection == "back"
                        break
                    else
                        puts "Invalid selection"
                    end
                end
            elsif abv_selection == "exit"
                break
            else
                puts ""
                puts "Invalid selection"
            end
        end
        puts ""
        puts "Goodbye!"
        puts ""
    end

end