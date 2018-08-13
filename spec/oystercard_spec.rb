require 'oystercard'

describe OysterCard do

  describe "#balance" do
    it "has a starting balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up do" do
    it "tops up by given amout" do
      expect(subject.top_up(10)).to eq subject.balance
    end
  end
end
