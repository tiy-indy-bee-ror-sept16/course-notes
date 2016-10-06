require 'csv'

students = CSV.foreach("students.csv", headers: true, header_converters: :symbol)

students.each do |student|
  puts "Hi. My name is #{student[:name]} and I'm from #{student[:hometown]}"
end

names = CSV.foreach("students.csv", headers: true, header_converters: :symbol).collect{ |row| row[:name] }

puts names.inspect

average_age = students.reduce(0) { |sum, student| sum + student[:age].to_i }/students.count

puts average_age
