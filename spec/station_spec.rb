require 'station'

RSpec.describe Station do

  subject { described_class.new(name: "Hoxton", zone: 1) }
  # let(:subject) { described_class.new("Hoxton", 1)}

  it 'knows its name' do
    expect(subject.name).to eq("Hoxton")
  end

  it 'knows its zone' do
    expect(subject.zone).to eq(1)
  end
end
