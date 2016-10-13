require_relative 'animal'
require 'pry'

class Dog < Animal

  def initialize(name="Ralph", legs = 4, weight = 12)
    super(name, legs, weight)
  end

  def bark(speech="woof")
    "The dog says: #{speech}"
  end

  def mate(other)
    rand(1..6).times.collect { super(other) }
  end

  # def rdhetr
  #   super
  # end

end

binding.pry
