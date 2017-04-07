require_relative '../config/environment'

describe Neighborhood do
  it 'has restaurants' do
    expect(Neighborhood.new.restaurants.class).to eq Array
  end
end
