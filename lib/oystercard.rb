class Oystercard
  attr_reader :balance
  attr_reader :entry_station
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
  end

  def top_up(number)
    raise "Balance can't be greater than £#{MAX_BALANCE}" if (@balance + number) > MAX_BALANCE
    @balance += number
  end

  def touch_in(station)
    raise 'Balance not high enough' if @balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  def deduct(number)
    @balance -= number
  end
end
