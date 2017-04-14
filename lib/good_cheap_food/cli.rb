
class CLI

  def call
    puts "Welcome to Good, Cheap Food! Here's how to start:"
    puts "1. Search for food or restaurants by neighborhood, cuisine, or name."
    puts "2. Or, see a list by typing 'List [neighborhoods, cuisines, dishes, restaurants]'"
  end


end


### Basic functionality ###
# - Search by neighorhood ==> Restaurant, Cuisine ==> Rest. drill down: Rest, address, phone, dishes
# - Search by cuisine ==> Restaurant, Neighborhood ==> Rest. drill down: Rest, address, phone, dishes
# - Search by dish ==> Price, @ Restaurant ==> Rest. drill down: Rest, address, phone, dishes
# - List all restaurants ==> Restaurant, neighborhood, cuisine
# - List all cuisines ==> Cuisines, in neighborhoods ==> Cuisine: Rest, Neighborhood ==> Rest. drill down: Rest, address, phone, dishes
# - List all neighborhoods ==> Neighborhoods (with cuisines?)
