class Post

  attr_accessor :title, :body, :created_at, :author, :id

  def initialize(id:, title:, body:, author:, timestamp: Time.now)
    self.id = id
    self.title = title
    self.body = body
    self.author = author
    self.created_at = timestamp
  end

  def self.all
    @posts ||= 5.times.each_with_index.collect do |_num, index|
      Post.new(
        id: index + 1,
        title: Faker::Book.title,
        body: Faker::Lorem.paragraphs(rand(4..10)).join("\n\n"),
        author: Author.all.sample,
        timestamp: rand(1..12).weeks.ago
      )
    end

  end

  def self.find(post_id)
    all.detect { |post| post.id == post_id.to_i }
  end


end
