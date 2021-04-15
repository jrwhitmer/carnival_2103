require './lib/attendee'
require './lib/ride'

class Carnival

  attr_reader :name,
              :rides,
              :attendees

  def initialize(name)
    @name = name
    @rides = []
    @attendees = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommend_rides(attendee)
    @rides.find_all do |ride|
      attendee.interests.include?(ride.name)
    end
  end

  def admit(attendee)
    @attendees << attendee
  end

  def attendees_by_ride_interest
    attendees_by_ride_interest = {}
    @rides.each do |ride|
      matching_attendees = @attendees.find_all do |attendee|
        attendee.interests.include?(ride.name)
      end
        attendees_by_ride_interest[ride] = matching_attendees
    end
    attendees_by_ride_interest
  end
end
