module Creatable
  module Instancethods

  end

  module ClassMethods
    def create(name)
      new.tap do |x|
        x.name = name
        x.save
      end
    end

    def find_by_name(name)
      obj = all.select{|x| x.name = name}
      obj[0]
    end

    def find_or_create_by_name(name)
      if find_by_name(name)
        find_by_name(name)
      else
        create(name)
      end
    end
  end
end
