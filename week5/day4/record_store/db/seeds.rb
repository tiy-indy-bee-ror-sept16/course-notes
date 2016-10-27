# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artist = Artist.create!(
  name: Faker::StarWars.character,
  bio: Faker::ChuckNorris.fact
)

10.times do

  Album.create!(
    name: Faker::StarWars.planet,
    release_year: rand(1920..2016),
    artist: artist,
    rating: rand(1..5)
  )

end
