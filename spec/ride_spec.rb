require './lib/ride'
require 'rspec'

RSpec.describe Ride do

  context 'instantiation' do
    it 'exists' do
      ride = Ride.new({name: 'Ferris Wheel', cost: 0})
      expect(ride).to be_instance_of(Ride)
    end
  end

end
