require_relative 'delivery'
require 'csv'

deliveries = CSV.foreach(
              "./planet_express_logs.csv",
              headers: true,
              header_converters: :symbol
             ).collect do |row|
               Delivery.new(row)
             end

puts deliveries.inspect

total_revenue = deliveries.reduce(0) do |sum, delivery|
  sum + delivery.money
end

puts total_revenue

by_pilot = deliveries.group_by { |delivery| delivery.pilot }

by_pilot.each do |pilot, deliveries|
  puts pilot
  puts "Made #{deliveries.length} deliveries"
  puts "We made #{deliveries.reduce(0){|sum, dev| sum + dev.money}}"
end
