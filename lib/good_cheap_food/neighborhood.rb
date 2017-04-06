class Neighborhood
  extend Findable
  extend Creatable
  extend Savable::ClassMethods
  include Savable::InstanceMethods

  attr_accessor :name, :restaurants

  @@all = []

  def initialize(name)
    name = name
    restaurants = []
    all << self
  end

  def self.all
    @@all
  end


end
