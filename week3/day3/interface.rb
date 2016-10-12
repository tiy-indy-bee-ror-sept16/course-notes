require './game'

class HighLow

  attr_accessor :game

  def initialize
    self.game = Game.new
  end

  def play
    say_hello
    computer_turn
    player_turn
    winner_winner_chicken_dinner
    rematch?
  end

  def say_hello
    puts "Let's play HighLow. We'll each roll six die. Highest total wins"
  end

  def computer_turn
    game.turn("computer")
  end

  def player_turn
    puts "Hit [enter] to roll"
    gets
    game.turn("player")
  end

  def winner_winner_chicken_dinner
    if game.winner == "tie"
      puts "Ya'll tied at #{game.total("player")}-#{game.total("computer")}"
    else
      puts "#{game.winner} won #{game.total(game.winner)}-#{game.total(game.loser)}"
    end
  end

  def rematch?
    puts "Would you like to play again (y)?"
    desire = gets.chomp.downcase[0]
    if desire == "y"
      play
    else
      exit
    end
  end

end

HighLow.new.play
