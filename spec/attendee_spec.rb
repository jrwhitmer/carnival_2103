require './lib/attendee'
require 'rspec'

RSpec.describe Attendee do

  context 'instantiation' do
    it 'exists' do
      attendee = Attendee.new('Bob', 20)
      expect(attendee).to be_instance_of(Attendee)
    end
  end
end
