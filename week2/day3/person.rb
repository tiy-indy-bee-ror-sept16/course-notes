require 'erb'

class Person

  attr_accessor :name,
                :height,
                :hair_color,
                :eye_color,
                :weight,
                :age,
                :babies

  def initialize(this_name, new_height, hair_color, age=30)
    self.name = this_name
    self.height = new_height
    self.hair_color = hair_color
    self.age = age
    self.babies = []
  end
  # attr_reader :name, :height, :hair_color, :eye_color, :weight
  # attr_writer :name, :height, :hair_color, :eye_color, :weight

  # def name
  #   @name
  # end

  # def name=(new_name)
  #   @name = new_name
  # end

  # def height
  #   @height
  # end

  # def height=(new_height)
  #   @height = new_height
  # end

  def speak(text="Destroy all robots")
    system("say #{text}")
  end

  def how_tall?
    "I am #{height} inches tall"
  end

  def walk(steps=2)
    "🚶" * steps
  end

  def 💩
    "poopin'"
  end

  def make_baby
    self.babies << Baby.new(height/6, hair_color, 0, self)
  end

  def make_babies(num=1)
    num.times do
      make_baby
    end
  end

end

class Kid < Person

  def walk(steps=2)
    if age < 3
      "I'm not walking yet"
    else
      "🚶" * steps
    end
  end

  def bawl
    system("say bwahahaaaaaaaaaaaaaaa")
  end

end

class Baby < Person

  attr_accessor :parent

  def initialize(height, hair_color, age, parent)
    self.name = parent.name + " Junior, Lord of the Manor, also Zuul"
    self.height = height
    self.hair_color = hair_color
    self.age = age
    self.parent = parent
  end

  def walk(steps="hell no")
    "I'm a baby. I _crawl_."
  end

  def crawl(feet="some")
    "I crawled #{feet} feet ..."
  end

end

person = Person.new(ARGV[0], rand(40..300), "blonde", rand(20..90))

puts person.babies.length

person.make_babies(rand(1..10))

arr = [1,2,3,4,5,6]

new_file = File.open("./index.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
