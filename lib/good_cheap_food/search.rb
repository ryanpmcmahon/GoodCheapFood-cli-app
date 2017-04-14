class Search
  attr_reader :search_term, :result

  def initialize(search_term)
    @search_term = search_term
  end

  def detect
    if Restaurant.find_by_name(search_term) != nil
      @result = Restaurant.find_by_name(search_term)
    elsif Cuisine.find_by_name(search_term) != nil
      @result = Cuisine.find_by_name(search_term)
    else Neighborhood.find_by_name(search_term) != nil
      @result = Neighborhood.find_by_name(search_term)
    end
  end

  def display
    result.display_profile
  end
end
