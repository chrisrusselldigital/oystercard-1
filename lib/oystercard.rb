class Oystercard

attr_reader :balance, :in_journey, :entry_station, :exit_station, :journeys

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_CHARGE = 3

def initialize
  @balance = 0
  @journeys = {}
end

def top_up(amount)
  fail "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if (amount + self.balance) > MAXIMUM_BALANCE
  @balance += amount
end

def in_journey?
  !!entry_station
end

def touch_in(station)
  fail "You don't have sufficient funds." if @balance < MINIMUM_BALANCE
  @entry_station = station
end

def touch_out(station)
  deduct(MINIMUM_CHARGE)
  @exit_station = station
  @journeys[@entry_station] = @exit_station
  @entry_station = nil
end


private
def deduct(amount)
  @balance -= amount
end

end
