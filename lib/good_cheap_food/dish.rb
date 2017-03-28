class Dish
  attr_accessor :name, :price, :cuisine, :restaurants

  def initialize(name, price)
    @name = name
    price = price
    @restaurants = []
  end

  def cuisine(cuisine)
    @cuisine = cuisine
  end
  #cuisine through restaurants?


end
