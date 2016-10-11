require_relative 'coffee/human'
require_relative 'coffee/coffee'
require_relative 'coffee/red_bull'

class DrinkingProblem

  attr_accessor :test_subject, :trials

  def initialize
    self.test_subject = Human.new "John Doe"
    self.trials = 0
  end

  def experiment(drink = Coffee)
    until test_subject.dead?
      self.trials += 1
      print case
      when test_subject.alertness < 1
        "I'm drinking #{drink.to_s.downcase}."
      when test_subject.alertness < 2
        "I'm drinking #{drink.to_s.upcase}."
      when test_subject.alertness < 3
        "I'm DRINKING #{drink.to_s.upcase}."
      else
        "I'M DRINKING #{drink.to_s.upcase} EEEEEEEEEEEEEEEEE!"
      end
      puts " My alertness level is #{test_subject.alertness}"
      coffee = drink.new "Black Death"
      test_subject.buy coffee
      until test_subject.beverage.empty?
        test_subject.drink!
      end
    end
    puts "He dead (after #{trials} beverages), with an alertness level of #{test_subject.alertness}"
  end

end

DrinkingProblem.new.experiment
DrinkingProblem.new.experiment(RedBull)
