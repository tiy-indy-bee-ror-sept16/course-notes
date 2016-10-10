class Delivery

  def self.attributes
    [:planet, :shipment, :crates, :money, :pilot]
  end

  def self.planet_to_pilots
    map = Hash.new("Leela")
    map["Earth"]  = "Fry"
    map["Mars"]   = "Amy"
    map["Uranus"] = "Bender"
    map
  end

  attr_accessor *attributes

  def initialize(destination:, shipment:, crates:, money:)
    self.planet = destination
    self.shipment = shipment
    self.crates = crates.to_i
    self.money = money.to_i
    self.pilot = self.class.planet_to_pilots[destination]
  end

end
