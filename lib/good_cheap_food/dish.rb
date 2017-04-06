class Dish
  attr_accessor :name, :price, :cuisine, :restaurants

  @@all = []

  def initialize
    @restaurants = []
  end

  def self.all
    @@all
  end

  def self.reset_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new.tap do |x|
      x.name = name
      x.save
    end
  end

  def self.find_by_name(name)
    obj = all.select{|x| x.name = name}
    obj[0]
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else
      create(name)
    end
  end

  def cuisine=(cuisine)
    @cuisine = cuisine
  end
  #cuisine through restaurants?

end
