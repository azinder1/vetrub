class Pet
  attr_reader(:pet_name, :animal, :age, :id)

  def initialize(attributes)
    @pet_name = attributes[:pet_name]
    @animal = attributes[:animal]
    @age = attributes[:age]
    @id = attributes[:id]
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
      @id = pet["id"].to_i()
      pets.push(Pet.new(:pet_name => pet_name, :animal => animal, :age => age, :id => @id))
    end
    pets
  end
  def save
    result = DB.exec("INSERT INTO pets (name, animal, age) VALUES ('#{@pet_name}', '#{@animal}', '#{@age}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
  def self.find(id)
    found_pet = nil
    Pet.all.each() do |pet|
      if pet.id(). == (id)
        found_pet = pet
      end
    end
    found_pet
  end
  def owners
    pet_owners = []
    owners = DB.exec("SELECT * FROM owners WHERE id_pet = #{self.id()};")
    owners.each() do |owner|
      name = owner["name"]
      phone = owner["phone"]
      id = owner["id"].to_i
      id_pet = owner["id_pet"].to_i
      pet_owners.push(Owner.new({:name => name, :phone => phone, :id_pet => id_pet, :id => id}))
    end
    pet_owners
  end
end
