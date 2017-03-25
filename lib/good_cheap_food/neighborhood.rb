class Neighborhood
  attr_accessor :name, :restaurants, :neighborhoods

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
