require './lib/attendee'
require 'rspec'

RSpec.describe Attendee do

  context 'instantiation' do
    it 'exists' do
      attendee = Attendee.new('Bob', 20)
      expect(attendee).to be_instance_of(Attendee)
    end
    it 'can return name' do
      attendee = Attendee.new('Bob', 20)
      expect(attendee.name).to eq('Bob')
    end
    it 'can return spending money' do
      attendee = Attendee.new('Bob', 20)
      expect(attendee.spending_money).to eq(20)
    end
  end
end
