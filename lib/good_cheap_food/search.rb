class Search
  attr_reader :search_term, :result

  def initialize(search_term)
    @search_term = search_term
  end

  def detect_search_term
    if Restaurant.find_by_name(search_term) != nil
      @result = Restaurant.find_by_name(search_term)
    elsif Cuisine.find_by_name(search_term) != nil
      @result = Cuisine.find_by_name(search_term)
    elsif Neighborhood.find_by_name(search_term) != nil
      @result = Neighborhood.find_by_name(search_term)
    else
      @result = 'n/a'
    end
  end

  def display
    if result == 'n/a'
      puts == result
    else
      result.display_profile
    end
  end
end
