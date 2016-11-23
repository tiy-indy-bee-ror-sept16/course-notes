require 'csv'

class Parser

  def self.secrets
    @secrets ||= []
  end

  def self.<<(secretive)
    secrets << secretive
  end

  attr_accessor :file, :klass

  # def file
  #   @file
  # end
  #
  # def file=(new_file)
  #   @file = new_file
  # end

  def initialize(file:, klass: Men)
    @file = file
    self.klass = klass
    # parse
  end

  # def klass=(other)
  #   @klass = other
  #   notify_the_authorities
  # end

  def parse
    self.class.parse(self)
  end

  def tell_secrets
    secrets
  end

  def self.parse(instance)
    CSV.foreach(instance.file, headers: true, header_converters: :symbol)
      .collect{ |row| instance.klass.new(row.to_h) }
  end


  # def other_initialize(file, other=nil, klass=Men)
  #
  # end

  # protected
  private

  def secrets
    "You shouldn't ever see this. It's private"
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
#
# local
# @instance
# # @@class
# # $global
# CONSTANTS
