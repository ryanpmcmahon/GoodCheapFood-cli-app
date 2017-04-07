module Findable
  def find_by_name(name)
    obj = all.select{|x| x.name == name}
    obj[0]
  end
end
