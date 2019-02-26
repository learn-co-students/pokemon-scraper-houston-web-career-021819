class Pokemon

attr_accessor :id, :name, :type, :db


def initialize(id)
    @id = id
    @name = name
    @type = type
    
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
end

def self.find(id, db)
  pull_character = db.execute ("SELECT * FROM pokemon WHERE id = #{id}")   
  pokemon = Pokemon.new(pull_character[0][0])
  pokemon.name = pull_character[0][1]
  pokemon.type = pull_character[0][2]
  pokemon
end

end 
