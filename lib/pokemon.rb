require 'sqlite3'
require 'pry'

class Pokemon

    attr_accessor :id, :name, :type, :db,:hp
    def initialize(id)
        @id = id
        @name = name
        @type = type
        @hp = hp
 
    end
    
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES('#{name}', '#{type}')")
    end

    def self.find(id, db)
        selected_pokemon = db.execute("SELECT * FROM pokemon WHERE id = '#{id}'")
        new_pokemon = Pokemon.new(selected_pokemon[0][0])
        new_pokemon.name = selected_pokemon[0][1]
        new_pokemon.type = selected_pokemon[0][2]
        new_pokemon.hp = selected_pokemon[0][3]
        new_pokemon
    end

    def alter_hp(hp, db)
        db.execute("UPDATE pokemon SET hp = '#{hp}' WHERE id = '#{id}'")   
    end
end
