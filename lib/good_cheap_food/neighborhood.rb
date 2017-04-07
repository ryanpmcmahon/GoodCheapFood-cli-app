class Neighborhood
  extend Findable
  extend Creatable
  extend Savable::ClassMethods
  include Savable::InstanceMethods

  attr_accessor :name
  attr_reader :restaurants

  @@all = []

  def initialize
    @restaurants = []
  end

  def cuisines
    restaurants.map{|r| r.cuisine}
  end

end
