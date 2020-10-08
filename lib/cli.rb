require_relative '../environment'

class CLI

    def start
        Beer.create_beers              #create beer objects
        puts ""
        puts "-----Welcome to Brew By ABV!-----"
        puts ""
        puts "You can find beers to brew based on the ABV% you're looking for."
        abv_selection = nil
        while abv_selection != "exit"       #full exit loop
            puts ""
            puts "1. 4% - 6.9% ABV"
            puts ""
            puts "2. 7% - 9.9% ABV"
            puts ""
            puts "3. 10% and up ABV"
            puts ""
            puts "Enter number next to desired ABV%, or to quit type 'exit'" 
            puts ""
            abv_selection = gets.strip.downcase         #enter abv% selection
            
            if abv_selection.to_i == 1                  #low abv list selection
                beer_selection = nil
                while beer_selection != "back"
                    puts ""
                    puts "Name, ABV%, Style" 
                    puts ""
                    Beer.low_abv.each_with_index do |x, ind|        #print low abv beer list
                        puts ""
                        puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
                    end
                    puts ""
                    puts "To see more details about a beer, enter the corresponding number."
                    puts "Type 'back' to return to the main menu."
                    puts ""
                    beer_selection = gets.strip.downcase                            #select which beer to view description of

                    if (1..Beer.low_abv.length).include?(beer_selection.to_i)       #check if beer selection is valid number
                        recipe_selection = nil
                        while recipe_selection != "back"
                            selected_beer = Beer.low_abv[beer_selection.to_i - 1]   #print selected beer details
                            puts ""
                            puts "#{selected_beer.name}:"
                            puts ""
                            puts "#{selected_beer.description}"
                            puts ""
                            puts "Would you like to see recipe for this beer?"
                            puts "Type 'yes' to view recipe, or 'back' to go back."
                            puts ""
                            
                            recipe_selection = gets.strip.downcase          #get recipe description
                            if recipe_selection == "yes"
                                puts "#{selected_beer.recipe.list_recipe}"
                                puts ""
                                while recipe_selection != "back"
                                    puts ""
                                    puts "type back to return to beer selection"
                                    puts ""
                                    recipe_selection = gets.strip.downcase
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
             


            elsif abv_selection.to_i == 2                           #mid abv list
                beer_selection = nil
                while beer_selection != "back"
                    puts ""
                    puts "Name, ABV%, Style" 
                    puts ""
                    Beer.mid_abv.each_with_index do |x, ind|        #print mid abv beer list
                        puts ""
                        puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
                    end
                    puts ""
                    puts "To see more details about a beer, enter the corresponding number."
                    puts "Type 'back' to return to the main menu."
                    puts ""
                    beer_selection = gets.strip.downcase                            #select which beer to view description of

                    if (1..Beer.mid_abv.length).include?(beer_selection.to_i)       #check if beer selection is valid number
                        recipe_selection = nil
                        while recipe_selection != "back"
                            selected_beer = Beer.mid_abv[beer_selection.to_i - 1]   #print selected beer details
                            puts ""
                            puts "#{selected_beer.name}:"
                            puts ""
                            puts "#{selected_beer.description}"
                            puts ""
                            puts "Would you like to see recipe for this beer?"
                            puts "Type 'yes' to view recipe, or 'back' to go back."
                            puts ""
                            
                            recipe_selection = gets.strip.downcase          #get recipe description
                            if recipe_selection == "yes"
                                puts "#{selected_beer.recipe.list_recipe}"
                                puts ""
                                while recipe_selection != "back"
                                    puts ""
                                    puts "type back to return to beer selection"
                                    puts ""
                                    recipe_selection = gets.strip.downcase
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

            elsif abv_selection.to_i == 3                           #high abv list
                beer_selection = nil
                while beer_selection != "back"
                    puts ""
                    puts "Name, ABV%, Style" 
                    puts ""
                    Beer.high_abv.each_with_index do |x, ind|        #print high abv beer list
                        puts ""
                        puts "#{ind + 1}. #{x.name}, #{x.abv}%, #{x.tagline}"
                    end
                    puts ""
                    puts "To see more details about a beer, enter the corresponding number."
                    puts "Type 'back' to return to the main menu."
                    puts ""
                    beer_selection = gets.strip.downcase                            #select which beer to view description of

                    if (1..Beer.high_abv.length).include?(beer_selection.to_i)       #check if beer selection is valid number
                        recipe_selection = nil
                        while recipe_selection != "back"
                            selected_beer = Beer.high_abv[beer_selection.to_i - 1]   #print selected beer details
                            puts ""
                            puts "#{selected_beer.name}:"
                            puts ""
                            puts "#{selected_beer.description}"
                            puts ""
                            puts "Would you like to see recipe for this beer?"
                            puts "Type 'yes' to view recipe, or 'back' to go back."
                            puts ""
                            
                            recipe_selection = gets.strip.downcase          #get recipe description
                            if recipe_selection == "yes"
                                puts "#{selected_beer.recipe.list_recipe}"
                                puts ""
                                while recipe_selection != "back"
                                    puts ""
                                    puts "type back to return to beer selection"
                                    puts ""
                                    recipe_selection = gets.strip.downcase
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
            end
        end

    end

end