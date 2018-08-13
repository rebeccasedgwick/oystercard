class OysterCard

  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(number)
    raise "Balance can't be greater than £#{MAX_BALANCE}" if (@balance + number) > MAX_BALANCE
    @balance += number
  end

end
