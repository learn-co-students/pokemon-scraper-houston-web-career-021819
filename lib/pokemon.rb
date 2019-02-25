class Pokemon
    attr_accessor :id, :name, :type, :db, :hp
    @@all = []
    def initialize(id, hp = nil)
        self.id = id
        self.hp = hp
    end

    def self.save(name, type, db)
        ins_text = "INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');"
        db.execute(ins_text)
    end

    def self.find(id, db)
        ins_text = "SELECT * FROM pokemon WHERE id = #{id};"
        new_pokemon_arr = db.execute(ins_text) #[[1,"Pikachu","electric"]]

        new_pokemon = Pokemon.new(new_pokemon_arr[0][0]) #creates new object with id 1
        new_pokemon.name = new_pokemon_arr[0][1] #sets name to "Pikachu"
        new_pokemon.type = new_pokemon_arr[0][2] #sets type to "electric"
        new_pokemon.hp = new_pokemon_arr[0][3]
        return new_pokemon #returns fully initialized pokemon
    end

    def alter_hp(new_value,db)
        ins_text = "UPDATE pokemon SET hp = #{new_value} WHERE id = #{self.id};"
        db.execute(ins_text)
    end
end
