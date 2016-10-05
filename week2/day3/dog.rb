class Dog

  attr_accessor :breed, :weight, :disposition, :fur_color, :name

  def wag
    "Wags tail vigorously (in your face)"
  end

end

class Puppy < Dog

  def poop_on_carpet
    "💩 💨"
  end

end

dog = Dog.new

dog.name = "Butch"

puts dog.wag
puts dog.name
puts dog.poop_on_carpet

puppy = Puppy.new

puts puppy.poop_on_carpet
