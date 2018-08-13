class OysterCard

  attr_reader :balance
  attr_reader :in_journey
  MAX_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(number)
    raise "Balance can't be greater than £#{MAX_BALANCE}" if (@balance + number) > MAX_BALANCE
    @balance += number
  end

  def deduct(number)
    @balance -= number
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
