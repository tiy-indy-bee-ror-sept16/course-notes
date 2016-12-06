@students = %w(Keith Luis Chris Jon Michael Brent Zach)


@keep = true

def pick_random
  @students.delete(@students.sample)
end

def ask_if_more
  if @students.empty?
    puts "All done. Have a nice day."
    @keep = false
  else
    puts "Hit 'y' to pick another."
    response = gets.chomp.downcase
    if response == "n"
      @keep = false
    end
  end
end

while @keep
  puts pick_random
  ask_if_more
end
