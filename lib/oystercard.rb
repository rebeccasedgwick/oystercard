class OysterCard
  attr_reader :balance
  attr_reader :in_journey
  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(number)
    raise "Balance can't be greater than £#{MAX_BALANCE}" if (@balance + number) > MAX_BALANCE
    @balance += number
  end

  def touch_in
    raise 'Balance not high enough' if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    @balance -= MINIMUM_FARE
  end

  private
  def deduct(number)
    @balance -= number
  end

end
