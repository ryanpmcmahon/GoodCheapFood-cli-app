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
end
