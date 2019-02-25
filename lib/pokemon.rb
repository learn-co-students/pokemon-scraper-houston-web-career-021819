require 'sqlite3'
# @db = SQLite3::Database.new('db/pokemon.db')
# @db.results_as_hash = true
require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id: nil, name:, type:, db: nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
    end

    def self.find(id, db)
        db.results_as_hash = true
        pokemon_hash= db.execute("SELECT * FROM pokemon WHERE id=#{id} LIMIT 1")[0]
        pokemon_new = Pokemon.new(id: pokemon_hash["id"], name: pokemon_hash["name"], type: pokemon_hash["type"])    
    end




end
#binding.pry
