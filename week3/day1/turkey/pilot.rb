require_relative 'group'

class Pilot < Group

  def bonus
    revenue * 0.1
  end

end
