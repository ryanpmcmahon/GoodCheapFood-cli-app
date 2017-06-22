class Cuisine
  extend Findable
  extend Creatable
  extend Savable::ClassMethods
  include Savable::InstanceMethods
  include Displayable

  attr_accessor :name, :restaurants
  attr_reader :profile

  @@all = []

  def initialize
    @restaurants = []
  end

  def create_profile
    @profile = {
      name: name,
      restaurants: restaurants.map { |e| e.name }
    }
  end
end
