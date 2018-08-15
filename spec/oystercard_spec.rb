require 'oystercard'

RSpec.describe OysterCard do

  it 'sets the maximum balance to 90' do
    expect { subject.top_up(100) }.to raise_error 'Balance can\'t be greater than £90'
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

  describe '#touch_in' do
    it 'checks if the oystercard is in a journey after touch_in' do
      subject.top_up(10)
      subject.touch_in
      expect(subject.in_journey).to be true
    end

    it 'does not let you travel without a balance above £1' do
      expect { subject.touch_in }.to raise_error('Balance not high enough')
    end
  end

  describe '#touch_out' do
    it 'checks if the oystercard is in a journey after touch_out' do
      subject.touch_out
      expect(subject.in_journey).to be false
    end

    it 'deducts a fare from the card balance on touch out' do
      subject.top_up(1)
      expect { subject.touch_out }.to change { subject.balance }.by(-OysterCard::MINIMUM_FARE)
    end
  end
end
