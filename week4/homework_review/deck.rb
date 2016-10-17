require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    self.cards = []
    Card.suits.each do |s|
      Card.faces.each do |f|
        cards << Card.new(f, s)
      end
    end
    cards.shuffle!
  end

  def deal
    cards.shift
  end

end
