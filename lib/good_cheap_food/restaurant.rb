class Restaurant
  attr_accessor :name, :neighborhood, :cuisine, :address, :profile, :recommended_dishes, :profile_url

  @@all = []

  def initialize(name)
    @name = name
    @recommended_dishes = []
    self.class.all << self
  end

  def self.new_from_scraper
    restaurants = Scraper.scrape_restaurant_list
    restaurants.each do |restaurant|
      new_rest = Restaurant.new(restaurant[:name])
      new_rest.profile_url = restaurant[:profile_url]
      rest_attr = Scraper.scrape_restaurant_profile(new_rest.profile_url)
      rest_attr.each do |attribute,v|
        new_rest.send("#{attribute}=", v)
      end
    end
  end

  def self.all
    @@all
  end
end
