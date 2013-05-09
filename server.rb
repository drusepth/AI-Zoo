require_relative 'config'
require_relative 'lib/bootstrap'

world = World.new # BANG!

puts @bot.to_s

world.update_loop