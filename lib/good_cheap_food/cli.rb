
class CLI

  def initialize
    Restaurant.new_from_scraper
  end

  def call
    puts "Welcome to Good, Cheap Food! Here's how to start:"
    puts "How would you like to start?"
    puts "Enter '1' to start a specific search"
    puts "Enter '2' to see a list of restaurants, neighborhoods, or cuisines"

    input = gets.strip

    if input == '1'
      puts "Enter the name of the restaurant, neighborhood, or cuisine you are searching for: "
      search = Search.new(gets.strip)
      search.detect_search_term
      search.display
      next_steps
    else
      puts "Enter '1' to list restaurants by name and neighborhood"
      puts "Enter '2' to list available neighborhoods"
      puts "Enter '3' to list avialable cuisines"
      cmd = gets.strips
      list(cmd)
      puts "Type name of item to see full profile:"
      search = Search.new(gets.strip)
      search.detect_search_term
      search.display

      next_steps
    end

  end

  def next_steps
    puts "What would you like to do next?"
    puts "Enter '1' to start a specific search"
    puts "Enter '2' to see a list of restaurants, neighborhoods, or cuisines"
    puts "Enter '3' to exit"
    i = gets.strips

    if i == 3
      puts 'Goodbye'
    else
      call
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
