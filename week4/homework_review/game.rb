require_relative 'deck'

class Game

  attr_accessor :deck, :player_hand, :dealer_hand

  def initialize
    self.deck = Deck.new
    self.player_hand = []
    self.dealer_hand = []
  end

  def play
    initial_deal # Phase One
    player_turn # Phase Two
    dealer_turn unless player_busted? # Phase Three
    winner_winner_chicken_dinner # Phase Four
    rematch # The Big Loop
  end

  def initial_deal
    2.times do
      player_hand << deck.deal
      dealer_hand << deck.deal
    end
    output_hands
  end

  def player_turn
    until player_busted? || player_stayed?
      hit_or_stay?
    end
  end

  def dealer_turn
    output_hands(true)
    until hand_value(dealer_hand) > 16
      dealer_hand << deck.deal
      output_hands(true)
    end
  end

  def winner_winner_chicken_dinner
    if blackjack?(dealer_hand)
      puts "Dealer blackjack. You lose."
    elsif blackjack?(player_hand)
      puts "Blackjack! You win!"
    elsif neither_busted? && hand_value(player_hand) > hand_value(dealer_hand)
      puts "You win"
    elsif hand_value(player_hand) > 21
      puts "Ya busted."
    elsif hand_value(dealer_hand) > 21
      puts "Dealer busted."
    elsif hand_value(dealer_hand) > hand_value(player_hand)
      puts "Dealer wins"
    else
      puts "other scenario"
    end
  end

  def rematch
    puts "Would you like to play again (y/n)?"
    desire = gets.chomp.downcase[0]
    if desire == "y"
      Game.new.play
    else
      exit
    end
  end

  def blackjack?(hand)
    hand_value(hand) == 21
  end

  def neither_busted?
    !(hand_value(player_hand) > 21) && !(hand_value(dealer_hand) > 21)
  end

  def hand_value(hand)
    hand.reduce(0) { |sum, card| sum + card.value }
  end

  def player_busted?
    hand_value(player_hand) > 21
  end

  def hit_or_stay?
    puts "Would you like to hit (h) or stay (s)?"
    stay = gets.chomp.downcase[0]
    if stay == "h"
      player_hit
      output_hands
    else
      @stayed = true
    end
  end

  def player_hit
    player_hand << deck.deal
  end

  def player_stayed?
    @stayed
  end

  def hand_display(hand)
    hand.collect { |card| card.to_s }.join("\n")
  end

  def output_hands(full = false)
    puts "You have\n#{hand_display(player_hand)}"
    if full
      puts "The dealer is showing:\n#{hand_display(dealer_hand)}"
    else
      puts "The dealer is showing: #{dealer_hand.first}"
    end
  end

end

Game.new.play
