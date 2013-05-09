class Creature
  include Entity

  @@data[:entities][:types] << Creature

  def self.random_spawn_chance; 0; end
  def symbol; 'c'; end

  def initialize
    @creator_name  = nil # Username of authenticated user
    @creature_name = nil # Name of submitted creature (randomize?)
  end

  # Create an empty source code file for this creature
  def create_source_file
    File.open(source_filename, 'w+') do |source|
      source.puts
    end
  end

  # Returns the full path to the source code for this creature
  def source_filename
    sanitized_filename = @owner_name.gsub('.', '-') + '.rb'
    full_path = @@config[:creatures][:directory] + '/' + sanitized_filename
  end

  # Returns the actual source code of this bot instance
  def source_code
    source = File.read(source_filename)
  end

end
