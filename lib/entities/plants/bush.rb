class Bush
  include Plant

  @@data[:entities][:types] << Bush

  def self.random_spawn_chance; 0.09; end
  def symbol; '%'; end

end