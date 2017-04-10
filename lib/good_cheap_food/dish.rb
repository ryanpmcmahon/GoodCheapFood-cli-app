class Dish
  extend Findable
  extend Creatable
  extend Savable::ClassMethods
  include Savable::InstanceMethods

  attr_accessor :name, :price, :cuisine, :restaurants

  @@all = []

  def initialize
    @restaurants = []
  end

  def price_list
    price_list = {}
    restaurants.each do |r|
      price = r.recommended_dishes.detect{|dish_arr| dish_arr.include?(self)}[1]
      price_list[r.name] = price
    end
    price_list
  end
end
