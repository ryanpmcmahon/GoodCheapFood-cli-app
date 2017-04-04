require_relative '../config/environment'

describe Dish do
  it "keeps record of all dishes" do
    dish = Dish.new
    dishes = Dish.all
    expect(dishes.length).to be > 0
  end

  it 'initializes with an array of restaurants that serve the dish' do
    d = Dish.new
    expect(d.restaurants.class).to eq 'Array'
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
