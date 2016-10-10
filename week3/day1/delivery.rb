class Delivery

  def self.pilot_map
    pilot_hash = Hash.new("Leela")
    pilot_hash["Earth"] = "Fry"
    pilot_hash["Mars"] = "Amy"
    pilot_hash["Uranus"] = "Bender"
    pilot_hash
  end

  attr_accessor :destination,
                :crates,
                :money,
                :shipment,
                :pilot

  def initialize(destination:, crates:, money:, shipment:)
    self.destination = destination
    self.crates = crates.to_i
    self.money = money.to_i
    self.shipment = shipment
    self.pilot = self.class.pilot_map[destination]
  end

  def bonus
    money * 0.1
  end

end
