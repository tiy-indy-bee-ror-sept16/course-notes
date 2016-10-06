require_relative 'robot'

class RobotFactory

  def make_robots(names)
    names.collect do |name|
      [Robot, BendingUnit, ActorUnit].sample.new(name: name)
    end
  end

end
