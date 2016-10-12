require_relative 'game'

if ARGV[0] && ARGV[0] == "bulk"
  Game.bulk_play
else
  game = Game.new
  game.play
end
