require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/owner')
require('./lib/pet')
require('pg')
require('pry-nav')

DB = PG.connect({:dbname => 'vet'})


get('/') do
  erb(:index)
end

get('/new') do
  erb(:pet_form)
end

post("/new") do
  pet_name = params["pet_name"]
  age = params["age"].to_i
  animal = params["animal"]
  pet = Pet.new(:pet_name => pet_name, :age => age, :animal => animal, :id => nil)
  pet.save
  @pets = Pet.all
  erb(:pets)
end

get('/pets') do
  @pets = Pet.all
  erb(:pets)
end

get('/pet/:id') do
  id = params['id'].to_i
  @pet = Pet.find(id)
  erb(:pet)
end

get ('/pet/:id/new') do
  id = params['id'].to_i
  @pet = Pet.find(id)
  erb(:owner_form)
end

post('/pet/:id/owner/new') do

  id = params['id'].to_i
  @pet = Pet.find(id)

  name = params["name"]
  phone = params["phone"]
  owner = Owner.new(:name => name, :phone => phone, :id => nil, :id_pet => id)
  owner.save

  erb(:pet)
end
