require 'oystercard'

RSpec.describe Oystercard do

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
    let(:station) { double :station }

    context 'when the oystercard has enough money to travel' do
      before do
        subject.top_up(Oystercard::MAX_BALANCE)
      end

      it 'checks if the oystercard is in a journey after touch_in' do
        subject.touch_in(station)
        expect(subject.in_journey?).to be true
      end

      it 'remembers the entry station you touched in at' do
        subject.touch_in(station)
        expect(subject.entry_station).to eq station
      end
    end

    it 'does not let you travel without a balance above £1' do
      expect { subject.touch_in(station) }.to raise_error('Balance not high enough')
    end
  end

  describe '#touch_out' do
    let(:station) { double :station }

    it 'checks if the oystercard is in a journey after touch_out' do
      subject.touch_out(station)
      expect(subject.in_journey?).to be false
    end

  context 'when the oystercard has enough money to travel' do
    before do
      subject.top_up(Oystercard::MAX_BALANCE)
    end
      it 'deducts a fare from the card balance on touch out' do
        expect { subject.touch_out(station) }.to change { subject.balance }.by(-Oystercard::MINIMUM_FARE)
      end

      it 'adds a journey hash to the journeys (history) array' do
        expect { subject.touch_out(station) }.to change { subject.journeys.length }.by(1)
      end
    end
  end

  describe '#journey_history_check' do
    it 'checks if the journey list is empty by default' do
      subject.journey_history_check
      expect(subject.journeys).to be_empty
    end
  end
end
