class Tree
  include Plant

  @@data[:entities][:types] << Tree

  def self.random_spawn_chance; 0.05; end
  def symbol; 'T'; end

  def update(world)
    super

    
  end

end