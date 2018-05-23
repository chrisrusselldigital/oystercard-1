require 'oystercard'

describe Oystercard do
subject(:card) { Oystercard.new }
let(:station) { double :station }

  context '#initialize' do
    it 'starts with a balance of zero' do
      expect(card.balance).to be == 0
    end
  end

  context "#balance" do
    it "Return the current balance" do
      expect(card.balance).to be_a Integer
    end
  end

  context "#top_up" do
    it 'can top up the balance' do
      expect { card.top_up 1 }.to change{ card.balance }.by 1
    end

    it "raises an error if the maximum balance is exceeded" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      card.top_up(maximum_balance)
      expect{ card.top_up 1 }.to raise_error "maximum balance of #{maximum_balance} exceeded."
    end
  end

context "#in_journey" do
  it 'it is initially not in a journey' do
    expect(card).not_to be_in_journey
  end
end

context "#touch_in" do
  it "can touch in" do
    card.top_up(Oystercard::MINIMUM_BALANCE)
    card.touch_in(station)
    expect(card).to be_in_journey
  end
  it "doesn't let you touch in if you do not have the minimum balance." do
    expect { card.touch_in(station) }.to raise_error "You don't have sufficient funds."
  end

  it 'stores the entry station' do
    card.top_up(Oystercard::MINIMUM_BALANCE)
    card.touch_in(station)
    expect(card.entry_station).to eq station
  end
end

context "#touch_out" do
  it "can touch out" do
    card.top_up(Oystercard::MINIMUM_BALANCE)
    card.touch_in(station)
    card.touch_out
    expect(card).not_to be_in_journey
  end

  it 'deducts the correct amount from the fare on touch out' do
    card.top_up(Oystercard::MINIMUM_BALANCE)
    card.touch_in(station)
    expect { card.touch_out }.to change{card.balance}.by -(Oystercard::MINIMUM_CHARGE)
  end
end


end
