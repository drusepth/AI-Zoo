# Require the world before everything else
require_relative 'world'

# Create global data object for use by loaded entities
require_relative 'data'

# Load all entities
require_relative 'entities/entity'    # Base class
require_relative 'entities/creature'
require_relative 'entities/plant'
