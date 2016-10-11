class Human
  attr_accessor :name,
                :alertness,
                :beverage

  def initialize(name, alertness=0)
    self.name = name
    self.alertness = alertness
  end

  def dead?
    alertness > 5
  end

  def has_coffee?
    !beverage.nil? && !beverage.empty?
  end

  def needs_coffee?
    !has_coffee?
  end

  def buy(beverage)
    self.beverage = beverage
  end

  def drink!
    self.alertness += beverage.alertness_change
    beverage.sip
  end


end
