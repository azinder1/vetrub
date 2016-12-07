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
  describe('.find') do
    it('can find a pet with a unique id') do
      pet1 = Pet.new(:pet_name => "Muffins", :animal => "Turtle", :age => 1, :id => nil)
      pet1.save()
      pet3 = Pet.new(:pet_name => "Spike", :animal => "Turtle" , :age => "100", :id => nil)
      pet3.save()
      expect(Pet.find(pet1.id())).to(eq(pet1))
    end
  end
  describe("#owners") do
    it("returns an array of owners for that pet") do
      pet1 = Pet.new(:pet_name => "Muffins", :animal => "Turtle", :age => 1, :id => nil)
      pet1.save()
      owner1 = Owner.new(:name => "Big Bertha", :phone => "555-5555", :id => nil, :id_pet => pet1.id())
      owner1.save
      # owner2 = Owner.new(:name => "Bubba", :phone => "444-4444", :id => nil, :id_pet => pet1.id())
      # owner2.save
      expect(pet1.owners()[0]).to(eq(owner1))
    end
  end
end
