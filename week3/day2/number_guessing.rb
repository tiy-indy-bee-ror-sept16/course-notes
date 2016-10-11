puts "Hi. Let's play guess a number."
puts "I'll pick a number between 1 and 1000."
puts "And I'll tell you if you're high or low."
puts "Ready to go?"

gets

new_game = "y"

while new_game == "y"
  computer = rand(1..1000)
  player_guess = 0
  until player_guess == computer
    puts "What's your guess?"
    player_guess = gets.chomp.to_i
    if computer > player_guess
      puts "You're too low."
    elsif computer < player_guess
      puts "You're Willie Nelson."
    else
      puts "You got it!\n\nMy number was #{computer}."
    end
  end
  puts "Would you like to play again? (Press y for yes)"
  new_game = gets.chomp.downcase
end

puts "Thanks for playing!"
