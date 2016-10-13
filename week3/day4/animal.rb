require_relative 'basic_functions'
require_relative 'introspection'

class BadBreedingPracticesError < StandardError
end

# Describes an animal
class Animal
  include BasicFunctions
  extend Introspection
  #
  # def self.details_of(thing)
  #   thing.methods
  # end

  def grow(new_weight)
    self.weight += new_weight
  end

  def mate(other)
    raise BadBreedingPracticesError if self.class != other.class
    self.class.new(
      name + other.name,
      number_of_legs,
      (weight + other.weight) / 2
    )
  end
end
