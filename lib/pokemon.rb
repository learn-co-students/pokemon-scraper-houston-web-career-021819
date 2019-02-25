require 'pry'
require 'sqlite3'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(name: nil, id: nil, type: nil, db: nil, hp: nil)
    self.hp = hp
    self.name = name
    self.type = type
    self.id = id
    self.db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",[name, type])
  end

  def self.find(id, db)
    db.results_as_hash = TRUE
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ? ", [id])[0]
    Pokemon.new(name: found_pokemon["name"], id: found_pokemon["id"], type: found_pokemon["type"], db: db, hp: found_pokemon["hp"])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE name = (?)", [hp, self.name])
  end
end
