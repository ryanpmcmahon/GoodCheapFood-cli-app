class Dish
  attr_accessor :name, :price, :cuisine, :restaurants

  @@all = []

  def initialize
    @restaurants = []
    self.class.all << self
  end

  def cuisine(cuisine)
    @cuisine = cuisine
  end
  #cuisine through restaurants?

  def self.all
    @@all
  end

end
