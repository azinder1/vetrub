require("rspec")
require("pg")
require("vet")
require("pet")
require('owner')
require('appointment')
require('medical_history')
require "pry-nav"

DB = PG.connect({:dbname => "vet_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM vets *;")
    DB.exec("DELETE FROM pets *;")
    DB.exec("DELETE FROM appointments *;")
    DB.exec("DELETE FROM owners *;")
    DB.exec("DELETE FROM history *;")
  end
end
