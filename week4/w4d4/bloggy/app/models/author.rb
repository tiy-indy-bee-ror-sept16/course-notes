class Author

  attr_accessor :name, :bio, :id

  def initialize(id:)
    self.name = Faker::StarWars.character
    self.bio = Faker::Hipster.paragraph
    self.id = id
  end

  def self.all
    @authors ||= 3.times.collect do |index|
      Author.new(id: index + 4)
    end
  end

  def self.find(author_id)
    all.detect { |author| author.id == author_id.to_i }
  end

  def posts
    Post.all.select { |post| post.author == self }
  end

end
