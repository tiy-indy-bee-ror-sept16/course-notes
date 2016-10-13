module BasicFunctions
  # class Locomotion
  # end

  attr_accessor :name, :number_of_legs, :weight, :position

  def initialize(name, number_of_legs, weight)
    self.name = name
    self.number_of_legs = number_of_legs
    self.weight = weight
    self.position = 0
  end

  def move(units)
    self.position += units
  end

end
