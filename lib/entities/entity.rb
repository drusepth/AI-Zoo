module Entity

  # Code to be run when this entity is added to the game world
  def initialize(x, y)
    @age = 0

    @alive = true

    @x, @y = x, y
  end

  # Pass the entity's visible world state in and let them respond accordingly
  def update(world)
    @age += 1
    puts "age is now " + @age.to_s

    if @age > 100
      puts "destruction triggered"
      trigger_destruction
    end

  end

  # Returns an (x, y) pair
  def location
    return [@x, @y]
  end

  # Code to kill itself
  def trigger_destruction
    @alive = false
  end

  # Returns whether this entity is alive
  def alive?; @alive; end

  # Define the chance to randomly spawn this (child) entity
  def self.random_spawn_chance; 0; end

  # Define the symbol used to draw this entity on the map
  def symbol; '?'; end

end