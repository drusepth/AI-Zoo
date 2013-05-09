class World
  @width  = @@config[:world][:width]
  @height = @@config[:world][:height]

  def initialize
    @day = 0
  end
  
  def update_loop
    while true
      @day += 1
      puts "Day " + @day.to_s #if @age % 100000 == 0
      sleep 1
    end
  end

  # Print the entire world to STDOUT
  def print_world

  end

  # Print a rectangular section of the world
  def print_section(ul_x, ul_y, br_x, br_y)

  end

end