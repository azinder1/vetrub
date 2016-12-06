class Pet
  attr_reader(:pet_name, :animal, :age, :id)

  def initialize(attributes)
    @pet_name = attributes[:pet_name]
    @animal = attributes[:animal]
    @age = attributes[:age]
    @id = nil
  end

  def ==(another_pet)
    (self.pet_name && self.animal && self.age) == (another_pet.pet_name && another_pet.animal && another_pet.age)
  end

  def self.all
    returned_pets = DB.exec("SELECT * FROM pets;")
    pets = []
    returned_pets.each() do |pet|
      pet_name = pet["name"]
      animal = pet["animal"]
      age = pet["age"].to_i
      id = pet["id"].to_i()
      pets.push(Pet.new(:pet_name => pet_name, :animal => animal, :age => age, :id => id))
    end
    pets
  end
  def save
    result = DB.exec("INSERT INTO pets (name, animal, age) VALUES ('#{pet_name}', '#{animal}', '#{age}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
end
