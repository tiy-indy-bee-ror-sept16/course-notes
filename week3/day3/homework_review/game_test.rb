require 'minitest/autorun'
require 'minitest/pride'
require_relative 'game'

class GameTest < MiniTest::Test

  attr_accessor :game

  def setup
    self.game = Game.new(true)
  end

  def test_rock_wins
    game.computer_choice = "scissors"
    game.player_choice = "rock"
    assert_equal "PLAYER WINS!", game.pick_a_winner
  end

  def test_invalid_pick
    game.player_choice = "rdghr5jht5"
    refute game.valid_pick?
  end

  def test_paper_loses_vs_scissors
    game.computer_choice = "scissors"
    game.player_choice = "paper"
    assert_equal "COMPUTER WINS!", game.pick_a_winner
  end
  # 
  # def teardown
  #   puts game.inspect
  # end

end
