require_relative '../config/environment'

describe Restaurant do
  it "initializes with a name and array for menu items" do
    restaurant = Restaurant.new("Mexique")
    expect(restaurant.name).to eq "Mexique"
    expect(restaurant.recommended_dishes).to eq []
  end

  it "can call all instances" do
    obj = Restaurant.all
    expect(obj).to be
  end

  describe '#new_from_scraper' do
    it 'creates new restaurants from scraped restaurant list' do
      Restaurant.new_from_scraper
      expect(Restaurant.all.count).to be > 0
    end
  end


end
