require_relative 'card'
require_relative 'deck'
require_relative 'hand'
class Game

  attr_accessor :discard,
                :player_1_hand,
                :player_2_hand,
                :deck

  def initialize
    self.deck = Deck.new
    self.player_1_hand = Hand.new
    self.player_2_hand = Hand.new
    fill_hands
    start_discard
    rounds
  end

  def fill_hands
    5.times do
      player_1_hand << deck.draw
      player_2_hand << deck.draw
    end
  end

  def start_discard
    self.discard = deck.draw
  end

  def rounds
    until player_1_hand.empty? || player_2_hand.empty?
      state_of_game
      player_turn("1")
      player_turn("2")
    end
    display_winner
  end

  def state_of_game
    puts "The discard is currently #{discard}"
  end

  def player_turn(player)
    if player == "1"
      this_player = player_1_hand
    else
      this_player = player_2_hand
    end
    if card = this_player.select_a_card(discard)
      puts "A #{card} is played"
      if card.is_8?
        card.suit = this_player.largest_suit
      end
      self.discard = card
    else
      puts "A card is drawn"
      this_player << deck.draw
    end
  end

  def display_winner
    puts "#{winner} won"
  end

  def winner
    player_1_hand.empty? ? "Player One" : "Player Two"
  end

end

Game.new
