require './lib/ride'
require 'rspec'

RSpec.describe Ride do

  context 'instantiation' do
    it 'exists' do
      ride = Ride.new({name: 'Ferris Wheel', cost: 0})

      expect(ride).to be_instance_of(Ride)
    end
    it 'can return name' do
      ride = Ride.new({name: 'Ferris Wheel', cost: 0})

      expect(ride.name).to eq('Ferris Wheel')
    end
    it 'can return cost' do
      ride = Ride.new({name: 'Ferris Wheel', cost: 0})

      expect(ride.cost).to eq(0)
    end
  end

end
