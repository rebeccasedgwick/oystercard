require_relative 'station'

class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journeys
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @journeys = []
    @hash = {}
  end

  def top_up(number)
    raise "Balance can't be greater than £#{MAX_BALANCE}" if (@balance + number) > MAX_BALANCE
    @balance += number
  end

  def touch_in(station)
    # throw error if station is not a Station
    raise 'Balance not high enough' if @balance < MINIMUM_FARE
    @entry_station = station
    start_journey(station)
    in_journey?
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    end_journey(station)
    in_journey?
  end

  def in_journey?
    !!entry_station
  end

  def journey_history_check
    @journeys
  end

  private

  def start_journey(station)
    @hash = Hash.new
    @hash[:entry_station] = station
  end

  def end_journey(station)
    @hash[:exit_station] = station
    @journeys << @hash
  end

  def deduct(number)
    @balance -= number
  end
end
