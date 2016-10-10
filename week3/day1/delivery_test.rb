require 'minitest/autorun'
require_relative './delivery'

class DeliveryTest < MiniTest::Test

  def delivery_hash(destination="Earth")
    { destination: destination,
      shipment: "Booze",
      crates: "50",
      money: "35000" }
  end

  def test_deliveries_have_attributes
    delivery = Delivery.new(delivery_hash)
    assert delivery.destination == "Earth", delivery.destination.inspect
    assert delivery.shipment == "Booze"
    assert delivery.crates == 50
    assert delivery.money == 35000
  end

  def test_pilot_map
    assert Delivery.pilot_map.is_a?(Hash), Delivery.pilot_map.inspect
  end

  def test_fry_pilot_logic
    delivery = Delivery.new(delivery_hash)
    assert delivery.pilot == "Fry", delivery.pilot.inspect
  end

  def test_amy_pilot_logic
    delivery = Delivery.new(delivery_hash("Mars"))
    assert delivery.pilot == "Amy", delivery.pilot.inspect
  end

  def test_bender_pilot_logic
    delivery = Delivery.new(delivery_hash("Uranus"))
    assert delivery.pilot == "Bender", delivery.pilot.inspect
  end

  def test_leela_pilot_logic
    delivery = Delivery.new(delivery_hash("Neptune"))
    assert delivery.pilot == "Leela", delivery.pilot.inspect
  end

  def test_bonus
    delivery = Delivery.new(delivery_hash)
    assert delivery.bonus == 3500.0, delivery.bonus.inspect
  end

  def test_uneven_bonuses
    delivery = Delivery.new(delivery_hash)
    delivery.money = 35755
    assert delivery.bonus == 3575.5, delivery.bonus.inspect
  end

end
