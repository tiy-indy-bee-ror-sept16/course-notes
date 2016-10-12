class Die

  include Comparable

  attr_accessor :sides, :exposed_side

  def initialize(num = 6)
    self.sides = (1..num).collect{|x| x}
  end

  def roll
    self.exposed_side = sides.sample
  end

  def <=>(other)
    exposed_side <=> other.exposed_side
  end

  def +(other)
    exposed_side + other.exposed_side
  end

  def coerce(other)
    [other, exposed_side]
  end

end
