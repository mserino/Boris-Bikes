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
		expect {station.dock(Bike.new)}.to raise_error(RuntimeError)
	end

	it 'should be able to release broken bikes to the van' do
		bike.break!
		station.dock(bike)
		station.release_broken_bikes(bike, van)
		expect(station.broken_bikes).to eq []
		expect(van.broken_bikes).to eq [bike]
	end

	it 'if tries to release fixed bikes to the van, raises an error' do
		station.dock(bike)
		expect {station.release_broken_bikes(bike,van) }.to raise_error RuntimeError
	end

end