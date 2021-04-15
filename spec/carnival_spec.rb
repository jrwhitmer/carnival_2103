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
    it 'has no attendees by default' do
      jeffco_fair = Carnival.new("Jefferson County Fair")

      expect(jeffco_fair.attendees).to eq([])
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

  context '#recommend_rides' do
    it 'can recommend rides by attendee' do
      jeffco_fair = Carnival.new("Jefferson County Fair")

      ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
      bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
      scrambler = Ride.new({name: 'Scrambler', cost: 15})

      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      bob = Attendee.new('Bob', 20)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')

      sally = Attendee.new('Sally', 20)
      sally.add_interest('Scrambler')

      expect(jeffco_fair.recommend_rides(bob)).to eq([ferris_wheel, bumper_cars])
      expect(jeffco_fair.recommend_rides(sally)).to eq([scrambler])
    end
  end

  context '#admit' do
    it 'can add attendees' do
      jeffco_fair = Carnival.new("Jefferson County Fair")
      bob = Attendee.new('Bob', 20)
      sally = Attendee.new('Sally', 20)
      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)

      expect(jeffco_fair.attendees).to eq([bob, sally])
    end
  end

  context '#attendees_by_ride_interest' do
    it 'can return a hash of attendees interested in each ride' do
      jeffco_fair = Carnival.new("Jefferson County Fair")

      ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
      bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
      scrambler = Ride.new({name: 'Scrambler', cost: 15})

      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      bob = Attendee.new('Bob', 20)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')

      sally = Attendee.new('Sally', 20)
      sally.add_interest('Bumper Cars')

      johnny = Attendee.new("Johnny", 5)
      johnny.add_interest('Bumper Cars')

      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expect(jeffco_fair.attendees_by_ride_interest).to eq({ferris_wheel => [bob], bumper_cars => [bob, sally, johnny], scrambler => []})
    end
  end

  context '#ticket_lottery_contestants' do
    it 'can return attendees eligible for lottery per ride' do
      jeffco_fair = Carnival.new("Jefferson County Fair")

      ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
      bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
      scrambler = Ride.new({name: 'Scrambler', cost: 15})

      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      bob = Attendee.new('Bob', 0)
      bob.add_interest('Ferris Wheel')
      bob.add_interest('Bumper Cars')

      sally = Attendee.new('Sally', 20)
      sally.add_interest('Bumper Cars')

      johnny = Attendee.new("Johnny", 5)
      johnny.add_interest('Bumper Cars')

      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expect(jeffco_fair.ticket_lottery_contestants(bumper_cars)).to eq([bob, johnny])
    end
  end
end
