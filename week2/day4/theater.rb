require_relative 'movie'

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

films = movies.collect do |film|
  Movie.new(film)
end

films.each do |film|
  puts film.title
end

leo_movies = films.select { |movie| movie.starring? "Leonardo DiCaprio" }

puts "Leo Movies:"
leo_movies.each do |movie|
  puts movie.title
end

hanks_movies = films.select { |movie| movie.starring? "Hanks" }
puts hanks_movies.length

ha_movies = films.select { |movie| movie.starring? "Ha" }
puts ha_movies.length

total_budget = films.reduce(:+)
puts total_budget
