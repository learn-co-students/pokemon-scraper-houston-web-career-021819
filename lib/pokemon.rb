require 'pry'
require 'sqlite3'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(db)
    self.db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",[name, type])
  end

  def self.find(id, db)
    pokemon_from_db = Pokemon.new(db)
    db.results_as_hash = TRUE
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ? ", [id])[0]
    pokemon_from_db.id = found_pokemon["id"]
    pokemon_from_db.name = found_pokemon["name"]
    pokemon_from_db.type = found_pokemon["type"]
    pokemon_from_db.hp = found_pokemon["hp"]
    return pokemon_from_db #this feels so clunky...
  end

  def alter_hp(hp, db)
    @db.execute("UPDATE pokemon SET hp = (?) WHERE name = (?)", [hp, self.name])
  end


end
