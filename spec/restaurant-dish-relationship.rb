require_relative '../config/environment'

describe Restaurant do
  it "creates new Dish instances when adding dishes" do
    r = Restaurant.new
    r.recommended_dishes = [["eggs", "$2.99"], ["coffee", "$1.99"]]
    dish_names = Dish.all.map{|dish| dish.name}
    expect(dish_names).to include "eggs"
  end
end

describe Dish do
  it 'has prices through restaurants' do
    r = Restaurant.new
    r.name = 'place'
    r.recommended_dishes = [["eggs", "$2.99"], ["coffee", "$1.99"]]
    dish = Dish.find_or_create_by_name("eggs")
    dish_price = dish.price_list[r.name]
    expect(dish_price).to eq "$2.99"
  end

  it 'has cuisines through restaurants' do
    r = Restaurant.new
    r.cuisine = 'breakfast'
    r.recommended_dishes = [["eggs", "$2.99"], ["coffee", "$1.99"]]
    dish = Dish.find_or_create_by_name("eggs")
    expect(dish.cuisines).to include r.cuisine
  end
end
