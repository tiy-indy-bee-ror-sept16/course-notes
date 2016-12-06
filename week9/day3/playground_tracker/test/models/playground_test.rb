require 'test_helper'

class PlaygroundTest < ActiveSupport::TestCase

  def test_geocoding_happens
    play = Playground.new(raw_address: "475 East Market Street, Indianapolis, IN")
    play.save!

    assert play.lat
    assert play.lng
  end

  def test_nearby
    play = Playground.create!(raw_address: "475 East Market Street, Indianapolis, IN")
    play2 = Playground.create!(raw_address: "425 East Market Street, Indianapolis, IN")

    nearby = play.nearby
    assert_equal 1, nearby.count
    assert_equal play2, nearby.first
  end

end
