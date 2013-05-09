class World

  # Create the world
  def initialize
    @width  = @@config[:world][:width]  # Width in tiles of world
    @height = @@config[:world][:height] # Height in tiles of world

    # A map of the world's terrain
    @terrain_map = Array.new(@width) { Array.new(@height) { @@config[:symbols][:terrain][:nothing] }}

    @day = 0  # Number of update_loops successfully completed for this world

    create_random_world
  end

  # Create a random world
  def create_random_world
    randomize_terrain
  end

  # Fill the world with random terrain
  def randomize_terrain
    valid_terrains = @@config[:symbols][:terrain].values

    (0...@width).each do |x|
      (0...@height).each do |y|
        chosen_terrain = valid_terrains[rand valid_terrains.length]
        @terrain_map[x][y] = chosen_terrain
      end
    end 
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

  # Print the terrain map
  def print_terrain_map
    print_terrain_section(0, 0, @width - 1, @height - 1)
  end

  # Print a rectangular subset of the terrain map
  def print_terrain_section(ul_x, ul_y, br_x, br_y)
    (ul_y...br_y).each do |y|
      (ul_x...br_x).each do |x|
        print @terrain_map[x][y]
      end
      puts
    end
    puts
  end

end