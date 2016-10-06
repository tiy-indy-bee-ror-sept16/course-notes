class Drink

  attr_accessor :current_amount, :contents, :starting_amount

  def initialize(contents:)
    @contents = contents
    @current_amount = 1.0
    @starting_amount = 1.0
  end

  def drink
    self.current_amount = 0
  end

  def need_more?
    current_amount == 0
  end

  def amount_drank
    starting_amount - current_amount
  end

end

class Soda < Drink

  def drink
    self.current_amount -= 0.2
  end

end
