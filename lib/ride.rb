class Ride

  attr_reader :name
  
  def initialize(attributes)
    @name = attributes[:name]
    @cost = attributes[:cost]
  end

end
