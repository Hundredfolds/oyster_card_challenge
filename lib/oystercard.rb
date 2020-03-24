class Oystercard

  attr_reader :balance, :in_system

  STARTING_BALANCE = 10
  CARD_LIMIT = 90

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @in_system = false
  end

  def top_up(num)
    raise "you cannot top up #{num} as it brings your card over the limit" if @balance + num > CARD_LIMIT
    @balance += num
  end

  def touch_in
    raise "outta cash" if @balance <= 0
    @in_system = true
  end

  def touch_out
    deduct
    @in_system = false
  end

  def in_journey?
    @in_system
  end

  private

  def deduct
    @balance -= 1
  end

end





=begin
reader
def balance
  @balance
end


writer

def balance(num)
  @balance = num
end

accessor
def balance(num)
  @balance = num
end
def balance
  @balance
end
=end
