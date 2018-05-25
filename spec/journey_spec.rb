require 'journey'


describe Journey do

  it "#entry_station" do
    expect(subject).to respond_to(:entry_station)
  end

  it "#exit_station" do
    expect(subject).to respond_to(:exit_station)
  end

  it "#complete?" do
    expect(subject.complete?).to be(true).or be(false)
  end

  it "#fare" do
    expect(subject.fare).to eq Journey::MINIMUM_CHARGE
  end

end
