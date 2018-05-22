require 'oystercard'

describe Oystercard do
subject(:card) { Oystercard.new }

  context '#initialize' do
    it 'starts with a balance of zero' do
      expect(subject.balance).to be == 0
    end
  end

  context "#balance" do
    it "Return the current balance" do
      expect(card.balance).to be_a Integer
    end
  end

  context "#top_up" do
    it 'can top up the balance' do
      expect { subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it "raises an error if the maximum balance is exceeded" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up 1 }.to raise_error "maximum balance of #{maximum_balance} exceeded."
    end
  end

  context "#deduct" do
    it 'deducts an amount from the balance' do
      subject.top_up(20)
      expect { subject.deduct 3}.to change{ subject.balance }.by -3
    end
  end

context "#in_journey" do
  it 'sets user status to in journey' do
    expect(card.in_journey).to eq(true).or eq(false)
  end
end








end
