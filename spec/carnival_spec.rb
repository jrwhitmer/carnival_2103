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
  end
end
