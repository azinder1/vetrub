class Owner
  attr_reader(:name, :phone, :id, :id_pet)

  def initialize(attributes)
    @name = attributes[:name]
    @phone = attributes[:phone]
    @id = attributes[:id]
    @id_pet = attributes[:id_pet]
  end

  def ==(another_owner)
    (self.name && self.phone ) == (another_owner.name && another_owner.phone)
  end

  def self.all
    returned_owners = DB.exec("SELECT * FROM owners;")
    owners = []
    returned_owners.each() do |owner|
      name = owner["name"]
      phone = owner["phone"]
      @id = owner["id"].to_i()
      owners.push(Owner.new(:name => name, :phone => phone, :id => @id))
    end
    owners
  end
  def save
    result = DB.exec("INSERT INTO owners (name, phone, id_pet) VALUES ('#{name}', '#{phone}', '#{@id_pet}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
end
