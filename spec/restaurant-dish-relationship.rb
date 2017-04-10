require_relative '../config/environment'

describe Restaurant do
  it "creates new Dish instances when adding dishes" do
    r = Restaurant.new
    r.recommended_dishes = [["eggs", "$2.99"], ["coffee", "$1.99"]]
    dish_names = Dish.all.map{|dish| dish.name}
    expect(dish_names).to include "eggs"
  end
end
