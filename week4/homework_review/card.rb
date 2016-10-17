class Card

  def self.suits
    %w(Spades Clubs Hearts Diamonds)
  end

  def self.faces
    ("2".."10").to_a + %w(Jack Queen King Ace)
  end

  attr_accessor :face, :suit, :value

  def initialize(face, suit)
    self.face = face
    self.suit = suit
    self.value = determine_value
  end

  def determine_value
    if face == "Ace"
      11
    elsif %w(J Q K).include? face[0]
      10
    else
      face.to_i
    end
  end

  def +(other)
    value + other.value
  end

  def to_s
    "a #{face} of #{suit}"
  end

end
