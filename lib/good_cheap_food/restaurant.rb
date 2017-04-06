class Restaurant
  extend Findable
  extend Creatable
  extend Savable::ClassMethods
  include Savable::InstanceMethods

  attr_accessor :name, :profile_url, :recommended_dishes, :neighborhood, :cuisine, :address

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
    @recommended_dishes = []
    menu_arr.each do |dish_arr|
      new_dish = Dish.new(dish_arr[0]) unless Dish.all.map{|d| d.name}.include?(dish_arr[0])
      # need a create or find by name for dishes
    end
  end
end
