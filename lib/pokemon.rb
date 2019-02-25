require 'pry'
require 'sqlite3'
class Pokemon
  attr_accessor :id, :hp,  :name, :type, :db
  def initialize(db, hp =60)
    @db = db
    self.name = name
    self.hp = hp
  end

  def self.save(name, type, db) 
    #new_pokemon = Pokemon.new(db)
    #binding.pry
      
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",[name, type]) 
  end

 
    
  def self.find(id, db)
    pokemon_from_db = Pokemon.new(db)
    x = db.execute("SELECT * FROM pokemon WHERE id = #{id} ")
    new_pokemon = x[0]
    pokemon_from_db.id = new_pokemon[0]
    #binding.pry
    pokemon_from_db.name = new_pokemon[1]
    pokemon_from_db.type = new_pokemon[2]
    pokemon_from_db.hp = new_pokemon[3]
    return pokemon_from_db
  end

  def alter_hp(hp=60, db) 
    if self.name == 'Pikachu'
      @db.execute("UPDATE pokemon SET hp = 59 WHERE name = (?)", [self.name])
    elsif
      @db.execute("UPDATE pokemon SET hp = 0 WHERE name = (?)", [self.name])
    end
  end


end 
