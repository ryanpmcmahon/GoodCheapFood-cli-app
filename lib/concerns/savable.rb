module Savable
  module ClassMethods
    def all
      self.class_variable_get(:@@all)
    end

    def reset_all
      all.clear
    end
  end

  module InstanceMethods
    def save
      self.class.all << self
    end
  end
end
