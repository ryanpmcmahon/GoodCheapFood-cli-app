
class CLI

  def call
    puts "Welcome to Good, Cheap Food! Here's how to start:"
    puts "1. Search for food or restaurants by neighborhood, cuisine, or name."
    puts "2. Or, see a list by typing 'List [neighborhoods, cuisines, dishes, restaurants]'"

    action = gets.strip.downcase.split(" ")

    task = action[0]

    if task == 'search'
      Search.new(action[1]).detect_search_term.display

    elsif task == 'list'
      
    else
      puts "Error: make sure to type 'Search' or 'List' first"
    end

  end


end


### Basic user functionality ###
# - Search by neighorhood ==> Restaurant, Cuisine ==> Rest. drill down: Rest, address, phone, dishes
# - Search by cuisine ==> Restaurant, Neighborhood ==> Rest. drill down: Rest, address, phone, dishes
# - Search by dish ==> Price, @ Restaurant ==> Rest. drill down: Rest, address, phone, dishes
# - List all restaurants ==> Restaurant, neighborhood, cuisine ==> Rest. drill down: Rest, address, phone, dishes
# - List all cuisines ==> Cuisines, in neighborhoods ==> Cuisine: Rest, Neighborhood ==> Rest. drill down: Rest, address, phone, dishes
# - List all neighborhoods ==> Neighborhoods (with cuisines?) ==> Neighborhood: restaurants with cuisines ==> Rest. drill down: Rest, address, phone, dishes


### Potential things to implement ####
# User launches gem
# user gets welcome message
# user asked to search or list something
# - use gets to ingest key word (search or list) and item
# - split string on space
# - use #send (?) to send key word to [search / list] class or method (?)
# User enters: search neighorhood
# program returns numbered list of restaurants w/ cuisines
# user enters number of restaurant they want more info for
# program returns restaurant profile (create #print_profile ?)
