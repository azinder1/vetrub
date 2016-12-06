require('spec_helper')
require ('pry-nav')

describe(Pet) do
  describe(".all") do
   it("is empty at first") do
     expect(Pet.all()).to(eq([]))
   end
 end

  describe('#name') do
    it('can take in user inputted names and return them') do
      pet1 = Pet.new(:pet_name => "Muffins", :animal => "Turtle", :age => 1, :id => nil)
    expect(pet1.pet_name()).to(eq("Muffins"))
    end
  end

  describe ('#==') do
    it('can recognize identical data') do
        pet1 = Pet.new(:pet_name => "Muffins", :animal => "Turtle", :age => 1)
        pet2 = Pet.new(:pet_name => "Muffins", :animal => "Turtle", :age => 1)
      expect(pet1).to(eq(pet2))
    end
  end

  describe('.all') do
    it('can take in user info and assign a unique id') do
      pet1 = Pet.new(:pet_name => "Muffins", :animal => "Turtle", :age => 1)
      pet1.save()
      expect(Pet.all()).to(eq([pet1]))
    end
  end
  describe('#id') do
    it('can generate a unique id and return it') do
      pet1 = Pet.new(:pet_name => "Muffins", :animal => "Turtle", :age => 1, :id => nil)
      pet1.save()
      expect(pet1.id()).to(be_instance_of(Fixnum))
    end
  end
end
