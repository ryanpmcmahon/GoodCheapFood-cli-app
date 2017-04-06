class Dish
  include Createable
  include Findable
  include Savable::ClassMethods
  extend Savable::InstanceMethods

  attr_accessor :name, :price, :cuisine, :restaurants

  @@all = []

  def initialize
    @restaurants = []
  end

  def cuisine=(cuisine)
    @cuisine = cuisine
  end
  #cuisine through restaurants?

end
