require 'oystercard'

describe OysterCard do

  it 'sets the maximum balance to 90' do
    expect{subject.top_up(100)}.to raise_error 'Balance can\'t be greater than £90'
  end

  describe '#balance' do
    it 'has a starting balance of 0' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up do' do
    it 'tops up by given amout' do
      expect(subject.top_up(10)).to eq subject.balance
    end
  end

  describe '#deduct' do
    it 'reduces the balance by a specified amount' do
      subject.top_up(20)
      subject.deduct(10)
      expect(subject.balance).to eq 10
    end
  end

  describe '#in_journey' do
    it 'checks if the oystercard is in a journey afte touch_in' do
      subject.touch_in
      expect(subject.in_journey).to eq true
    end

    it 'checks if the oystercard is in a journey afte touch_out' do
      subject.touch_out
      expect(subject.in_journey).to eq false
    end

  end
end
