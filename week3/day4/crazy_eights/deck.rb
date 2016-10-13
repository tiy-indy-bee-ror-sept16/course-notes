require_relative 'card'

class Deck < Array

  def initialize
    Card.suits.each do |s|
      Card.faces.each do |f|
        self << Card.new(f, s)
      end
    end
    shuffle!
  end

  def draw
    shift
  end

end
