require 'station'

describe Station do

	let(:station) { Station.new }
	let(:bike) { Bike.new }
	let(:van) { Van.new }

	it 'should know when it\'s full' do
		expect(station).not_to be_full
		10.times { station.dock(Bike.new) }
		expect(station).to be_full
	end

	it 'should not accept a bike if it\'s full' do
		10.times { station.dock(Bike.new)}
		expect(station.dock(Bike.new)).to eq "Is full!"
	end

end