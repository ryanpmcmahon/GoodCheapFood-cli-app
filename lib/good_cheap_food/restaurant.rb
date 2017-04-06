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
  end

  def recommended_dishes=(menu_arr)
    menu_arr.each do |dish_arr|
      new_dish = Dish.find_or_create_by_name(dish_arr[0])
      recommended_dishes << [new_dish, dish_arr[1]]
    end
  end
end
