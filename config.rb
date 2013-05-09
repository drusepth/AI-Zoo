@@config = {
  bots: {
    directory: 'bots'
  },

  world: {
    width:  30, # Tiles
    height: 10, # Tiles

    backup_frequency: 60, # Dump the state of the world every x seconds
  },

  symbols: {
    terrain: {
      dirt:    'd',
      grass:   'g',
      water:   'w'
    }
  }
}