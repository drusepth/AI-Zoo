class Bot
  @owner_name = nil # Username of authenticated user
  @bot_name   = nil # Name of submitted bot (randomize?)

  # Create an empty source code file for this bot
  def create_source_file
    File.open(source_filename, 'w+') do |source|
      source.puts
    end
  end

  # Returns the full path to the source code for this bot
  def source_filename
    sanitized_filename = @owner_name.gsub('.', '-') + '.rb'
    full_path = @@config[:bots][:directory] + '/' + sanitized_filename
  end

  # Returns the actual source code of this bot instance
  def source_code
    source = File.read(source_filename)
  end
end
