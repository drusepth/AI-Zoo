class World

  # Create the world
  def initialize
    @width  = @@config[:world][:width]  # Width in tiles of world
    @height = @@config[:world][:height] # Height in tiles of world

    # A map of the world's terrain
    @terrain_map = Array.new(@width) { Array.new(@height) { @@data[:terrain][:nothing] }}

    @day = 0  # Number of update_loops successfully completed for this world

    create_random_world
  end

  # Create a random world
  def create_random_world
    randomize_terrain
  end

  # Game loop for updating world
  def update_loop
    while true
      @day += 1

      puts "Day " + @day.to_s #if @age % 100000 == 0
      print_terrain_map

      sleep 1
    end
  end

  # Fill the world with random terrain
  def randomize_terrain
    valid_terrains = @@data[:terrain].values.map { |i| i[:symbol] }

    (0...@width).each do |x|
      (0...@height).each do |y|
        chosen_terrain = valid_terrains[rand valid_terrains.length]
        @terrain_map[x][y] = chosen_terrain
      end
    end 
  end

  # Print a rectangular subset of the terrain map
  def print_terrain_map(ul_x = 0, ul_y = 0, br_x = @width - 1, br_y = @height - 1)
    (ul_y...br_y).each do |y|
      (ul_x...br_x).each do |x|
        print @terrain_map[x][y]
      end
      puts
    end
    puts
  end

end