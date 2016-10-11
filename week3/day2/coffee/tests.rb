require 'minitest/autorun'

require './human'
require './coffee'

class CaffeineTest < MiniTest::Test
  def test_humans_tend_to_be_sleepy
    tyler = Human.new "Tyler"
    assert tyler.alertness < 0.1
  end

  def test_humans_need_coffee
    randy = Human.new "Randy"
    refute randy.has_coffee?
    assert randy.needs_coffee?
  end

  def test_humans_can_drink_coffee
    sherri = Human.new "Sherri"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    assert tsmf.full?

    sherri.buy tsmf
    sherri.drink!
    assert(sherri.alertness.between?(0.1, 0.33))
    refute tsmf.full?
    refute tsmf.empty?
  end

  def test_humans_can_drink_all_the_coffee
    trevor = Human.new "Trevor"
    tsmf = Coffee.new "Triple Shot Mocha Frappuccino"
    trevor.buy tsmf

    3.times { trevor.drink! }
    assert tsmf.empty?
    assert trevor.alertness > 0.9
  end

  def test_a_human_with_coffee_doesnt_need_coffee
    trent = Human.new "Trent"
    coffee = Coffee.new "Black"
    trent.buy coffee
    assert trent.has_coffee?
    refute trent.needs_coffee?
  end

  def test_an_empty_beverage_demands_more_coffee
    trent = Human.new "Trent"
    coffee = Coffee.new "Black"
    trent.buy coffee
    3.times { trent.drink! }
    assert coffee.empty?
    assert trent.needs_coffee?
    refute trent.has_coffee?  
  end

end
