# ### Explorer Mode

# 1. **Define a Robot class:** A robot has a name
# 2. Randomly assign the class of the robot on creation. And output the robot's class to html page as well.
class Robot

  attr_accessor :name, :height, :metal

  # 3. Robots should also have a height, with a default value of 10

  def initialize(name:, height: 10, metal: "Iron")
    @name = name
    @height = height
    @metal = metal
  end

  def to_s
    "#{name} :: #{height}, made of #{metal} and a #{self.class}"
  end

  # Robot.new(name: "Bender", height: 12)

  # def height
  #   @height || 10
  # end

  # def name
  #   @name
  # end
  #
  # def name=(new_name)
  #   @name = new_name
  # end

  # 2. A robot instance should have a method called 'say_hi' and it should return "Hi!"
  def say_hi
    "Hi"
  end

  # 3. A robot instance should have a method called 'say_name' and it should return "My name is X" where X is the robot's name
  def say_name
    "My name is #{name}"
  end

  # def name
  #   "Lord Metal #{@name}"
  # end

end

# 4. **Define a BendingUnit class**
# 5. A BendingUnit inherits from Robot
class BendingUnit < Robot

  # 6. A bending unit instance has a method called 'bend'
  # 7. The bend method has one argument 'object_to_bend'
  # 8. The bend method should return "Bend X!" where X is object_to_bend
  def bend(object_to_bend)
    "Bend #{object_to_bend}!"
  end

  def bend_all_these_things(arr)
    arr.collect{ |thing| bend(thing) }
  end

end

# 9. **Define an ActorUnit class**
# 10. An ActorUnit inherits from Robot

class ActorUnit < Robot

  # 11. An ActorUnit instance has a method called 'change_name'
  # 12. The 'change_name' method accepts an argument 'new_name'
  # 13. The 'change_name' method changes the name property of the robot to 'new_name'
  def change_name(new_name)
    self.name = new_name
  end

end
