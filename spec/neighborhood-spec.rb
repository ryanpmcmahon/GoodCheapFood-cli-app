require_relative '../config/environment'

describe Neighborhood do
  it 'has restaurants' do
    expect(Neighborhood.new.restaurants.class).to eq Array
  end

  it 'has cuisines through restaurants' do
    r = Restaurant.create('the place')
    r.cuisine = "new american"
    r.neighborhood = "UES"
    n = Neighborhood.find_or_create_by_name("UES")
    expect(n.cuisines).to include r.cuisine
  end
end
