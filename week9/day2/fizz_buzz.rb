# Print the numbers 1 to 100
# For multiples of 3, print "Fizz" instead of the number
# For multiples of 5, print "Buzz" instead of the number
# For multiples of 3 and 5, print "FizzBuzz" instead of the number

class FizzBuzz

  # def self.run
  # 	(1..100).to_a.map do |num|
  #    	if num % 15 == 0
  #         "FizzBuzz"
  #       elsif num % 5 == 0
  #         "Buzz"
  #       elsif num % 3 == 0
  #         "Fizz"
  #       else
  #         num
  #       end
  #   end
  # end

  def self.run
    1.upto(100).map do |i|
      str = ""
      str += "Fizz" if i % 3 == 0
      str += "Buzz" if i % 5 == 0
      if str == ""
        str = i
      end
      str
    end
  end

end
