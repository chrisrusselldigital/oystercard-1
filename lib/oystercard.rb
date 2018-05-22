class Oystercard

attr_reader :balance
attr_accessor :in_journey


MAXIMUM_BALANCE = 90

def initialize
  @balance = 0
  @in_journey = false
end

def top_up(amount)
  fail "maximum balance of 90 exceeded." if (amount + self.balance) > MAXIMUM_BALANCE
  @balance += amount
end

def deduct(amount)
  @balance -= amount
end


def in_journey
  @in_journey
end


end
