class Utility

  # Utility.add_these
  def self.add_these(num1, num2)
    puts "Hi from the class: #{num1 + num2}"
  end

  def self.instances
    @instances ||= []
  end

  def self.sum
    instances.reduce(0) { |total, x| total + x.sum }
  end

  attr_accessor :numbers

  def initialize(nums=[1,2,3,4,5])
    self.numbers = nums
    Utility.instances << self
  end

  def sum
    numbers.reduce(0) { |sum, num| sum + num.to_i }
  end

  def insert(num)
    numbers << num
  end

  # Utility.new.add_these
  def add_these(num1, num2)
    puts "Hi from an instance: #{num1 * num2}"
  end

  def my_object_id
    self.object_id
  end

end
