#!/usr/bin/env ruby

require 'erb'
require 'shellwords'

lipsum_wanted = ARGV[0].to_s.downcase
number_wanted = (ARGV[1] || 1).to_i.abs

lipsums = {}
lipsums["standard"] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ligula neque, ultrices eu nulla vitae, dapibus rhoncus erat. Etiam vestibulum purus at risus euismod facilisis. Pellentesque pretium pulvinar lacus, at scelerisque nisi maximus et. Nulla eleifend lobortis malesuada. Praesent lacinia iaculis nisi. Praesent ac euismod elit. Donec arcu sapien, porta ultricies imperdiet fringilla, posuere sed mauris. Donec nec eros porta, ultricies enim quis, interdum nisl. Nulla convallis, elit at mattis pretium, erat mauris consectetur mi, ut facilisis metus enim nec ex. Maecenas ac ex lacinia, rutrum orci vel, fermentum odio. Suspendisse consequat ac sapien eu tristique. Maecenas sit amet viverra metus, eu facilisis nisl. Morbi eget suscipit risus. Pellentesque id euismod ex. Suspendisse non turpis eget tortor lobortis ullamcorper."
lipsums["samuel"] = "Well, the way they make shows is, they make one show. That show's called a pilot. Then they show that show to the people who make shows, and on the strength of that one show they decide if they're going to make more shows. Some pilots get picked and become television programs. Some don't, become nothing. She starred in one of the ones that became nothing."
lipsums["hipster"] = "XOXO tilde keffiyeh banh mi literally, 90's single-origin coffee polaroid tbh church-key kickstarter. Semiotics gastropub umami, vice chillwave waistcoat 8-bit. Artisan gentrify vice cronut, letterpress chicharrones brunch street art pitchfork poke prism meggings bicycle rights fam. Paleo tattooed beard, gastropub messenger bag bushwick flexitarian kombucha gluten-free vinyl franzen banjo. Scenester quinoa tbh, umami man braid lyft knausgaard migas before they sold out cliche hell of hammock helvetica bitters. Yr waistcoat crucifix chia authentic hoodie. Poke four loko af butcher, cray gastropub sustainable kinfolk deep v williamsburg meditation listicle."
lipsums["bespoke"] = "BESPOKE street art pitchfork poke prism meggings bicycle rights fam. Paleo tattooed beard, gastropub messenger bag bushwick flexitarian kombucha gluten-free vinyl franzen banjo. Scenester quinoa tbh, umami man braid lyft knausgaard migas before they sold out cliche hell of hammock helvetica bitters. Yr waistcoat crucifix chia authentic hoodie. Poke four loko af butcher, cray gastropub sustainable kinfolk deep v williamsburg meditation listicle."

if lipsums[lipsum_wanted]
  output = lipsums[lipsum_wanted]
else
  puts "Hey. You need to pick one of #{lipsums.keys.join(", ")}"
end

def pbcopy_out(text)
  system("echo #{text.join("\n\n").shellescape} | pbcopy")
end

def speak_damn_you(words="Destroy all humans!!!")
  system("say #{words}")
end

def destroy_all_humans
  speak_damn_you
end

def longest_ipsum(selected_ipsums)
  statistical_ipsum(selected_ipsums)
end

def shortest_ipsum(selected_ipsums)
  statistical_ipsum(selected_ipsums, "shortest")
end

def statistical_ipsum(selected_ipsums, needed="longest")
  if needed == "longest"
    selected_ipsums.max_by{|key, ipsum| ipsum.length}[0]
  elsif needed == "shortest"
    selected_ipsums.min_by{|key, ipsum| ipsum.length}[0]
  else
    raise ArgumentError, "Please choose 'shortest' or 'longest'"
  end
end

def wordiest_ipsum(selected_ipsums)
  selected_ipsums.max_by{|key, ipsum| ipsum.split(" ").length}[0]
end

def produce_stats(lipsums)
  stats = []
  stats << "The longest ipsum is #{longest_ipsum(lipsums)}"
  stats << "The shortest ipsum is #{shortest_ipsum(lipsums)}"
  stats << "The wordiest ipsum is #{wordiest_ipsum(lipsums)}"
  stats << "The fugliest ipsum is #{statistical_ipsum(lipsums, "fugly")}"
end

if output
  stats = produce_stats(lipsums)
  # speak_damn_you("Writing your file now. Please wait.")
  output = number_wanted.times.map{ |_num| output }
  new_file = File.open("./#{lipsum_wanted}.html", "w+")
  new_file << ERB.new(File.read("index.html.erb")).result(binding)
  new_file.close
  pbcopy_out(output)
end
