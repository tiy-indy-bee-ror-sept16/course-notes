class Card

  def self.suits
    %w(clubs diamonds hearts spades)
  end

  def self.faces
    %w(2 3 4 5 6 7 8 9 10 J Q K A)
  end

  attr_accessor :face, :suit

  def initialize(face, suit)
    self.face = face
    self.suit = suit
  end

  def suited?(other)
    suit == other.suit
  end

  def faced?(other)
    face == other.face
  end

  def is_8?
    face == "8"
  end

  def is_match?(card)
    suited?(card) || faced?(card) || is_8?
  end

  def to_s
    "a #{face} of #{suit}"
  end

end
