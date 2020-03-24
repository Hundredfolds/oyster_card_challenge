class Oystercard

  attr_reader :balance, :last_station, :journeys

  STARTING_BALANCE = 10
  CARD_LIMIT = 90

  def initialize(balance = STARTING_BALANCE)
    @balance = balance
    @last_station = nil
    @journeys = []
  end

  def top_up(num)
    raise "you cannot top up #{num} as it brings your card over the limit" if @balance + num > CARD_LIMIT
    @balance += num
  end

  def touch_in(entry_station = "this is a station")
    raise "outta cash" if @balance <= 0
    @last_station = entry_station
  end

  def touch_out(exit_station = "this is a station")
    deduct
    update_journey(exit_station)
  end

  def in_journey?
    @last_station != nil
  end

  private

  def deduct
    @balance -= 1
  end

  def update_journey(station)
    journey = Hash.new
    journey[:entry] = @last_station
    journey[:exit] = station
    @journeys.push(journey)
    @last_station = nil
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
