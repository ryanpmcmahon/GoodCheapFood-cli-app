class Cuisine
  extend Findable
  extend Creatable
  extend Savable::ClassMethods
  include Savable::InstanceMethods

  attr_accessor :name, :restaurants

  @@all = []

  def initialize
    @restaurants = []
  end
end
