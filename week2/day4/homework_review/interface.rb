require 'erb'

require_relative 'robot_factory'

# 1. Take our student array from yesterday and (programmatically) create robots out of all of them and store them in an array. Add those robots to your output page.

our_class = %w(Luis Zach Michael Brent Jon Keith Chris)

# eached_robots = []
#
# our_class.each do |name|
#   eached_robots << Robot.new(name: name, metal: "Steel")
# end
#
# eached_robots.each do |robot|
#   puts robot
# end

# 2. Do the previous using an Enumerable method other than `each`


# collected_robots.each do |robot|
#   puts robot
# end

# 14. Output an `index.html` when running `ruby robots.rb <name> <object>`. Said page should use a BendingUnit with a name of `<name>` and use that BendingUnit to say hi, say their name and bend `<object>` and output all the above to HTML at `<robot_name>.html` where `<robot_name>` is the `<name>` given on the command line.

robot_name = ARGV[0]

robot = BendingUnit.new(name: robot_name)
object_to_bend = ARGV[1]
collected_robots = RobotFactory.new.make_robots(our_class)

new_file = File.open("./#{robot_name.downcase}.html", "w+")
new_file << ERB.new(File.read("template.html.erb")).result(binding)
new_file.close


# ### Adventure Mode
#

#
# ### Epic Mode
#
# 1. Use Bootstrap to make that output page look good.
# 3. Use <https://robohash.org/> to give each of our robots a unique avatar based on their name.
