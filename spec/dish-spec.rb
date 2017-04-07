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

  describe '#self.reset_all' do
    it 'deletes all entries in @@all' do
      new_dish = Dish.create('sushi')
      Dish.reset_all
      expect(Dish.all).to eq []
    end

  end

  describe "#find_by_name" do
    it "finds instances of dishes by their name" do
      Dish.reset_all
      dish = Dish.create("taco")
      x = Dish.find_by_name(dish.name)
      expect(x).to eq dish
    end

    it 'returns nil if dish doesnt exist' do
      Dish.reset_all
      expect(Dish.find_by_name('pasta')).to eq nil
    end
  end

  describe '#find_or_create_by_name' do
    it "finds instances of dishes by their name" do
      Dish.reset_all
      dish = Dish.create("taco")
      x = Dish.find_or_create_by_name(dish.name)
      expect(x).to eq dish
    end

    it 'creates dish if it does not exist' do
      Dish.reset_all
      tacos = Dish.find_or_create_by_name("tacos")
      expect(Dish.all).to include tacos
    end

    it 'does not duplicate dishes' do
      Dish.reset_all
      a = Dish.create('tacos')
      b = Dish.find_or_create_by_name('tacos')
      expect(Dish.all.select{|x| x.name == 'tacos'}.length).to eq 1
    end
  end

  it 'has prices from restaurants' do
    d = Dish.create('tacos')
    r = Restaurant.create('TacoBell')
    r.add_menu_item('tacos','$0.99')
    expect(d.price_list[r.name]).to eq '$0.99'
  end
end
