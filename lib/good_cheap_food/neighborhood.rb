class Neighborhood
  extend Findable
  extend Creatable
  extend Savable::ClassMethods
  include Savable::InstanceMethods

  attr_accessor :name, :restaurants, :cuisines

  @@all = []

  def initialize
    @restaurants = []
  end

end
