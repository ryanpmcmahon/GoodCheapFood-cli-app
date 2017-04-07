require_relative '../config/environment'

describe Restaurant do
  it "initializes with an array for menu items" do
    restaurant = Restaurant.new
    expect(restaurant.recommended_dishes).to eq []
  end

  it "can call all instances" do
    obj = Restaurant.all
    expect(obj).to be
  end

  # describe '#new_from_scraper' do
  #   it 'creates new restaurants from scraped restaurant list' do
  #     Restaurant.new_from_scraper
  #     expect(Restaurant.all.count).to be > 0
  #   end
  # end

  describe '#update_dish_price' do
    it 'updates dish price based on name, price' do
      diner = Restaurant.create("Diner")
      pancakes = Dish.create('pancakes')
      diner.recommended_dishes = [['pancakes', '$2.90'],['coffee','$0.99']]
      diner.update_dish_price(pancakes, '$2.99')
      expect(diner.recommended_dishes[0][1]).to eq '$2.99'
    end
  end

  describe '#add_menu_item' do
    it 'adds menu item and price to recommended_dishes' do
      Restaurant.reset_all
      Dish.reset_all
      r = Restaurant.new
      d = Dish.create('dish')
      r.add_menu_item('dish','$1.00')
      expect(r.recommended_dishes.flatten!).to include d
    end
  end

  describe '#cuisine=' do
    it 'sets a Cuisine class instance as a cuisine to restaurant' do
      r = Restaurant.new
      r.cuisine = 'italian'
      expect(r.cuisine.class).to be Cuisine
    end

    it 'does not create a cuisine instance if it exists' do
      r = Restaurant.new
      c = Cuisine.create("Asian")
      r.cuisine = "Asian"
      expect(r.cuisine).to eq c
    end

    it 'adds restaurant to cuisine restaurant array' do
      r = Restaurant.new
      c = Cuisine.create("mexican")
      r.cuisine = "mexican"
      expect(c.restaurants).to include r
    end
  end

  describe '#neighborhood=' do
    it 'sets a Neighborhood class instance as a neighborhood to restaurant' do
      r = Restaurant.new
      r.neighborhood = 'UWS'
      expect(r.neighborhood.class).to be Neighborhood
    end

    it 'does not create a neighborhood instance if it exists' do
      r = Restaurant.new
      n = Neighborhood.create("UES")
      r.neighborhood = "UES"
      expect(r.neighborhood).to eq n
    end

    it 'adds restaurant to neighborhood restaurant array' do
      r = Restaurant.new
      n = Neighborhood.create("downtown")
      r.neighborhood = "downtown"
      expect(n.restaurants).to include r
    end
  end
end
