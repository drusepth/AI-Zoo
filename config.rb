@@config = {
  bots: {
    directory: 'bots'
  },

  world: {
    width:  30, # Tiles
    height: 10, # Tiles

    backup_frequency: 60, # Dump the state of the world every x seconds
  },

  terrain: {
    dirt: {
      symbol: 'd'
    },
    grass: {
      symbol: 'g'
    },
    mud: {
      symbol: 'm'
    },
    water: {
      symbol: 'w'
    }
  },

  entities: {

  }
}