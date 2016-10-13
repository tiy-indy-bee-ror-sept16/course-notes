require_relative 'animal'
require 'pry'

class Cat < Animal

  def meow(speech = "purrrr")
    "The cat says: #{speech}"
  end

end

binding.pry
