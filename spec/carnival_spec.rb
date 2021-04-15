require './lib/attendee'
require './lib/ride'
require './lib/carnival'
require 'rspec'

RSpec.describe Carnival do

  context 'instantiation' do
    it 'exists' do
      jeffco_fair = Carnival.new("Jefferson County Fair")

      expect(jeffco_fair).to be_instance_of(Carnival)
    end
    it 'can return name' do
      jeffco_fair = Carnival.new("Jefferson County Fair")

      expect(jeffco_fair.name).to eq("Jefferson County Fair")
    end
    it 'has no rides by default' do
      jeffco_fair = Carnival.new("Jefferson County Fair")

      expect(jeffco_fair.rides).to eq([])
    end
  end
  context '#add_ride' do
    it 'can add a ride' do
      jeffco_fair = Carnival.new("Jefferson County Fair")
      ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
      jeffco_fair.add_ride(ferris_wheel)

      expect(jeffco_fair.rides).to eq([ferris_wheel])
    end
    it 'can store multiple rides' do
      jeffco_fair = Carnival.new("Jefferson County Fair")
      ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
      bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
      scrambler = Ride.new({name: 'Scrambler', cost: 15})
      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      expect(jeffco_fair.rides).to eq([ferris_wheel, bumper_cars, scrambler])
    end
  end
end
