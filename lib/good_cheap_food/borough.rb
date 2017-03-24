class Borough
  attr_accessor :restaurants, :neighborhoods

  @@all = []

  def initialize
    all << self
  end

  def self.all
    @@all
  end


end
