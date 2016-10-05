require 'erb'

our_class = %w(Luis Zach Jon Brent Michael Keith Chris)

short_names = []

our_class.each do |student|
  short_names << student if student.length < 5
end

puts short_names

short_names = our_class.select { |student| student.length < 5 }

puts "Select version:"

puts short_names

sentence = "Ruby is kinda fun once you get used to it"

four_words = []

sentence.split.each do |word|
  four_words << word if word.length == 4
end

puts four_words

four_words = sentence.split.select { |word| word.length == 4 }

puts "Select version:"

puts four_words

movies = []
movies << {
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
}

low_budgets = []

movies.each do |hash|
  if hash[:budget] < 100
    low_budgets << hash[:title]
  end
end

puts low_budgets

low_budgets = movies.select { |film| film[:budget] < 100 }.collect { |film| film[:title] }

puts "Select version:"

puts low_budgets

leo_movies = []

movies.each do |hash|
  if hash[:stars].include? "Leonardo DiCaprio"
    leo_movies << hash[:title]
  end
end

puts leo_movies

leo_movies = movies.select { |film| film[:stars].include? "Leonardo DiCaprio" }.collect { |film| film[:title] }

puts "Select version:"

puts leo_movies

def four_words(text)
  four_words = []

  text.split.each do |word|
    four_words << word if word.length == 4
  end
end

puts "Long version: #{four_words(sentence)}"

def how_many_words(text, num=4)
  text.split.select { |word| word.length == num }
end

def four_words(text)
  how_many_words(text)
end

four_words = four_words(sentence)

puts "Method version:"

puts four_words

total_budget = 0

movies.each do |film|
  total_budget += film[:budget]
end

puts total_budget

total_budget = movies.reduce(0) { |accumulator, film| accumulator + film[:budget] }

puts "Reduce version:"
puts total_budget

# new_file = File.open("./index.html", "w+")
# new_file << ERB.new(File.read("index.html.erb")).result(binding)
# new_file.close
