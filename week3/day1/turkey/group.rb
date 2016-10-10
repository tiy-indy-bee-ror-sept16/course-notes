class Group

  attr_accessor :name, :deliveries

  def initialize(name, deliveries)
    self.name = name
    self.deliveries = deliveries
  end

  def trips
    deliveries.length
  end

  def revenue
    deliveries.reduce(0) { |sum, delivery| sum + delivery.money }
  end

end
