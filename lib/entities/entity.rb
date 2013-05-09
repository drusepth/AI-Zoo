module Entity

  def initialize
    @age = 0
  end

  # Pass the entity's visible world state in and let them respond accordingly
  def update(world)
    @age += 1
  end

  # Define the chance to randomly spawn this (child) entity
  def self.random_spawn_chance; 0; end

  # Define the symbol used to draw this entity on the map
  def symbol; '?'; end

end