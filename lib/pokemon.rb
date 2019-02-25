require "pry"
require "sqlite3"

db = SQLite3::Database.new('pokemon.db')


class Pokemon

    # attr_reader :name, :db, :type
    attr_reader :db
    attr_accessor :id, :name, :type, :hp

    @@all = []


    def initialize(id: nil, name: nil, type: nil, db: nil, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
        @@all << self
    end

    def self.save(name, type, db)
        db.execute ("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
    end

    def self.find(id, db)
       new_pokemon = db.execute ("SELECT * FROM pokemon WHERE id == '#{id}'")
       returned_pokemon = Pokemon.new(id: new_pokemon[0][0], name: new_pokemon[0][1], type: new_pokemon[0][2], hp: new_pokemon[0][3])
       returned_pokemon
    end

    def alter_hp(hp, db)
        db.execute "UPDATE pokemon SET hp = '#{hp}' WHERE id == '#{id}'"
    end
    
end
