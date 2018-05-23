class Oystercard

attr_reader :balance, :in_journey, :entry_station

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 3

def initialize
  @balance = 0
end

def top_up(amount)
  fail "maximum balance of 90 exceeded." if (amount + self.balance) > MAXIMUM_BALANCE
  @balance += amount
end

def in_journey?
  !!entry_station
end

def touch_in(station)
  fail "You don't have sufficient funds." if @balance < MINIMUM_BALANCE
  @entry_station = station
end

def touch_out
  deduct(MINIMUM_CHARGE)
  @entry_station = nil
end

def entry_station
  @entry_station
end

private
def deduct(amount)
  @balance -= amount
end

end
