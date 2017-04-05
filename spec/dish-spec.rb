require_relative '../config/environment'

describe Dish do
  it 'initializes with an array of restaurants that serve the dish' do
    d = Dish.new
    expect(d.restaurants.class).to eq Array
  end

  describe '#self.create' do
    it "creates new instance using a name and saves to @@all" do
      dish = Dish.create('taco')
      expect(Dish.all).to include dish
    end

  end

  describe "#find_by_name" do
    it "finds instances of dishes by their name" do
      dish = Dish.new
      dish.name = "taco"
      x = Dish.find_by_name(dish.name)
      expect(x).to eq dish
    end

    it 'returns nil if dish doesnt exist' do
      expect(Dish.find_by_name('pasta')).to eq nil
    end
  end
end
