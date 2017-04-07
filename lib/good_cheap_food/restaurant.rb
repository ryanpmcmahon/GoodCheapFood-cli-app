class Restaurant
  extend Findable
  extend Creatable
  extend Savable::ClassMethods
  include Savable::InstanceMethods

  attr_accessor :name, :profile_url, :neighborhood, :cuisine, :address
  attr_reader :recommended_dishes

  @@all = []

  def initialize
    @recommended_dishes = []
  end

  def self.new_from_scraper
    restaurants = Scraper.scrape_restaurant_list
    restaurants.each do |restaurant|
      new_rest = Restaurant.find_or_create_by_name(restaurant[:name])
      new_rest.profile_url = restaurant[:profile_url]
      rest_attr = Scraper.scrape_restaurant_profile(new_rest.profile_url)
      rest_attr.each do |attribute,v|
        new_rest.send("#{attribute}=", v)
      end
    end
    all
  end

  def recommended_dishes=(menu_arr)
    menu_arr.each do |dish_arr|
      new_dish = Dish.find_or_create_by_name(dish_arr[0])
      new_dish.restaurants << self unless new_dish.restaurants.include?(self)
      new_dish_and_price = [new_dish, dish_arr[1]]
      recommended_dishes << new_dish_and_price unless recommended_dishes.include?(new_dish_and_price)
    end
  end

  def add_menu_item(dish_name, price)
    new_dish = Dish.find_or_create_by_name(dish_name)
    new_dish.restaurants << self unless new_dish.restaurants.include?(self)
    new_dish_and_price = [new_dish, price]
    recommended_dishes << new_dish_and_price unless recommended_dishes.include?(new_dish_and_price)
  end

  def update_dish_price(dish, price)
    recommended_dishes.each do |dish_arr|
      dish_arr[1] = price if dish_arr[0] == dish
    end
  end

  def cuisine=(cuisine)
    rest_cuisine = Cuisine.find_or_create_by_name(cuisine)
    @cuisine = rest_cuisine
    rest_cuisine.restaurants << self unless rest_cuisine.restaurants.include?(self)
  end
end
