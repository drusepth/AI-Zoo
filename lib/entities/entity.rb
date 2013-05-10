module Entity

  # Code to be run when this entity is added to the game world
  def initialize(x, y)
    @current_age = 0            # This entity's age, in terms of game ticks
    @max_age = 60 + rand(120)   # The age this entity will live to before dying

    @current_energy = 0         # Amount of energy this entity contains
    @energy_per_tick = 0.15     # Amount of energy gained every game tick
    @max_energy = 100           # Maximum amount of energy this entity can hold

    @alive = true               # Whether or not this entity is dead and ready for GC

    @x, @y = x, y               # This entity's (x,y) coordinates in the world
  end

  # Public getters
  def age; @current_age; end
  def current_energy; @current_energy; end
  def energy_per_tick; @energy_per_tick; end
  def max_energy; @max_energy; end
  def alive?; @alive; end
  def location; return [@x, @y]; end
  def x; return @x; end
  def y; return @y; end

  def self.random_spawn_chance; 0; end # Chance to randomly spawn this entity
  def symbol; '?'; end                 # Symbol used to draw this entity on a map

  # Pass the entity's visible world state in and let them respond accordingly
  def update(world)
    # Determine whether it is time to die yet
    @current_age += 1
    if @current_age > @max_age
      trigger_destruction
    end

    # Gain energy for the tick
    @current_energy = [@current_energy + @energy_per_tick, @max_energy].min
  end

  # Code to kill itself
  def trigger_destruction; @alive = false; end

end