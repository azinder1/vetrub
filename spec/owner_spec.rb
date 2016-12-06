require('spec_helper')
require ('pry-nav')

describe(Owner) do
  describe(".all") do
   it("is empty at first") do
     expect(Owner.all()).to(eq([]))
   end
 end

  describe('#name') do
    it('can take in user inputted names and return them') do
      owner1 = Owner.new(:name => "Big Bertha", :phone => "555-5555", :id => nil)
      owner1.save
    expect(owner1.name()).to(eq("Big Bertha"))
    end
  end

  describe ('#==') do
    it('can recognize identical data') do
        owner1 = Owner.new(:name => "Big Bertha", :phone => "555-5555", :id => nil)
        owner1.save
        owner2 = Owner.new(:name => "Big Bertha", :phone => "555-5555", :id => nil)
        owner2.save
      expect(owner1).to(eq(owner2))
    end
  end

  describe('.all') do
    it('can take in user info and assign a unique id') do
      owner1 = Owner.new(:name => "Big Bertha", :phone => "555-5555", :id => nil)
      owner1.save()
      expect(Owner.all()).to(eq([owner1]))
    end
  end
  # describe('#id') do
  #   it('can generate a unique id and return it') do
  #     owner1 = Owner.new(:name => "Big Bertha", :phone => "555-5555", :id => nil)
  #     owner1.save()
  #     expect(owner1.id()).to(be_instance_of(Fixnum))
  #   end
  # end
end
