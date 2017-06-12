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
      @result = nil
    end
  end

  def display
    if result == nil
      puts "Sorry, I can't find that."
    else
      result.create_profile
      result.display_profile
    end
  end
end
