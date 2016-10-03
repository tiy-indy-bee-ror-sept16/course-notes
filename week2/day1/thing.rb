require 'erb'

thing = ARGV[0].to_s.downcase

puts ARGV.inspect
puts thing.inspect

if thing.start_with? "h"
  output = "Hello"
elsif thing.start_with? "k"
  output = "Karate Kid, \"Part 2\""
elsif thing[-1] == "r"
  output = "This is an R-ending word"
else
  output =  "I don't understand that."
end

big_12_teams = ["Iowa State", "Kansas", "Kansas State", "Texas", "Texas Tech", "Baylor", "Oklahoma", "Oklahoma State", "TCU", "West Virginia"]

sports = %w(Football Basketball Soccer Baseball Rifle Women's\ Soccer)

puts sports.inspect

sports = sports.uniq
sports.sort!

big_12_teams.sort_by!{|team| team.length}

new_file = File.open("./#{thing}.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
