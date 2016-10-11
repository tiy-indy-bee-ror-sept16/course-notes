class Coffee

  attr_accessor :name, :drinks, :alertness_change

  # def drinks
  #   @drinks
  # end
  #
  # def drinks=(num)
  #   @drinks = num
  # end

  def initialize(name, drinks = 3, alertness = 0.31)
    self.name = name
    self.drinks = drinks
    self.alertness_change = alertness
  end

  def full?
    drinks == 3
  end

  def empty?
    drinks == 0
  end

  def sip
    self.drinks -= 1
  end

end
