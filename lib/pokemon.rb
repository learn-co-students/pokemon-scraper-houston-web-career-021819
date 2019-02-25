require 'pry'
require 'sqlite3'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id)
    @id = id
    @name = name
    @type = type
    @hp = 60
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)
    retreived_pokemon = db.execute("SELECT * FROM pokemon WHERE id = '#{id}'")
    this_pokemon = Pokemon.new(retreived_pokemon[0][0])
    this_pokemon.name = retreived_pokemon[0][1]
    this_pokemon.type = retreived_pokemon[0][2]
    this_pokemon.hp = retreived_pokemon[0][3]
    this_pokemon
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = '#{hp}' WHERE id ='#{self.id}'")
  end

end
