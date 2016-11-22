require 'csv'

class Parser

  attr_accessor :file, :klass

  def initialize(file:, klass: Men, other: nil)

  end

  def other_initialize(file, other=nil, klass=Men)

  end

end

# Parser.new(file: "something", other: "Hey")
# Parser.new(parse_hash)
#
# User.new(password: "playground", username: "Chris")
#
# User.new(user_params)
#
# def initialize(options = {})
#
# end
#
# other_initialize("something", Women)
