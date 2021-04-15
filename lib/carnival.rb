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

  def ticket_lottery_contestants(ride)
    @attendees.find_all do |attendee|
      attendee.spending_money < ride.cost
    end
  end

  def draw_lottery_winner(ride)
    if ticket_lottery_contestants(ride) != []
      (ticket_lottery_contestants(ride)).sample
    end
  end

  def announce_lottery_winner(ride)
    winner_name = draw_lottery_winner(ride).name
    ride_name = ride.name
    return "#{winner_name} has won the #{ride_name} lottery!"
  end
end
