class World

  # Create the world
  def initialize
    @width  = @@config[:world][:width]  # Width in tiles of world
    @height = @@config[:world][:height] # Height in tiles of world

    # A map of the world's terrain
    @terrain_map = Array.new(@width) { Array.new(@height) { @@data[:terrain][:nothing] }}

    # A map of the world's entities
    @entity_map = Array.new(@width) { Array.new(@height) { [] }}

    # A list of the world's living entities
    @living_entities = []

    @day = 0  # Number of update_loops successfully completed for this world

    create_random_world
  end

  # Create a random world
  def create_random_world
    randomize_terrain
    randomize_entities
  end

  # Game loop for updating world
  def update_loop
    while true
      @day += 1

      puts "Day " + @day.to_s #if @age % 100000 == 0
      print_terrain_map
      print_entity_map

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

  # Fill the world with random entities
  def randomize_entities
    valid_entities = @@data[:entities][:types].select { |e| e.random_spawn_chance > 0 }
    (0...@width).each do |x|
      (0...@height).each do |y|
        
        # Roll to see if any entities are created here
        chosen_entity = nil
        valid_entities.each do |e|
          roll = rand(100) / 100.0
          if roll < e.random_spawn_chance
            chosen_entity = e
            break
          end
        end

        # If an entity would be created here, add it to the world
        if chosen_entity
          entity = chosen_entity.new
          create_entity(entity, x, y)
        end

      end
    end
  end

  def create_entity(entity, x, y)
    @entity_map[x][y] << entity
    @living_entities << entity
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

  # Print a rectangular subset of the entity map
  def print_entity_map(ul_x = 0, ul_y = 0, br_x = @width - 1, br_y = @height - 1)
    (ul_y...br_y).each do |y|
      (ul_x...br_x).each do |x|
        if @entity_map[x][y].first
          print @entity_map[x][y].first.symbol
        else
          print @@data[:entities][:nothing]
        end
      end
      puts
    end
    puts
  end

end