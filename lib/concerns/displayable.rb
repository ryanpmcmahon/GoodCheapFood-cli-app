module Displayable
  # def create_profile
  #   profile = { name: self.name,
  #
  #   }
  # end

  def display_profile
    profile.each do |k,v|
      puts "#{k}: #{v}"
      puts "--------"
    end
  end

end
