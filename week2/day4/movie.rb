class Movie

  def self.say_hi
    "Hi from the class itself"
  end

  # Or. @movies_created ||= []
  def self.movies_created
    if @movies_created
      @movies_created
    else
      @movies_created = []
    end
  end

  attr_accessor :title, :budget, :stars, :director

  def initialize(title:, budget:, stars:)
    @title  = title
    @budget = budget
    @stars  = stars
    self.class.movies_created << self
    determine_director
  end

  def determine_director
    if starring? "Leo"
      @director = "Nolan"
    elsif starring? "Hamill"
      @director = "Lucas"
    end
  end

  def less_than_100?(&block)
    budget < 100
    if block_given?
      block.call(self)
    end
  end

  # A shorter way to down the collect downcase would be:
  # stars.map(&:downcase)
  # See also:
  # [1,2,3,4,5].reduce(:+)
  def starring?(actor)
    stars.collect { |name| name.downcase }.detect do |name|
      name.include? actor.downcase
    end
  end

  def >(other)
    budget > other.budget
  end

  def +(other)
    budget + other.budget
  end

  def coerce(other)
    [other, budget]
  end


end
