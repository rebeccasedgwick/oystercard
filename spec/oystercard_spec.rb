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
end
