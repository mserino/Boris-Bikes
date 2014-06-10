require 'van'

describe Van do

	let(:van) { Van.new }
	let(:bike) { Bike.new }
	let(:station) { Station.new }
	let(:garage) { Garage.new }

	it 'should know when is full' do
		expect(van).not_to be_full
		15.times { van.dock(Bike.new) }
		expect(van).to be_full
	end

	it 'should not accept a bike if it\'s full' do
		15.times { van.dock(Bike.new)}
		expect {van.dock(Bike.new)}.to raise_error(RuntimeError)
	end

	it 'can release broken bikes to the garage' do
		bike.break!
		station.dock(bike)
		station.release_broken_bikes(bike,van)
		van.release_broken_bikes(bike, garage)
		expect(garage.broken_bikes).to eq [bike]
	end

	it 'if tries to release fixed bikes to the garage, raises an error' do
		van.dock(bike)
		expect {van.release_broken_bikes(bike,garage) }.to raise_error RuntimeError
	end

	it 'can release fixed bikes to the station' do
		van.dock(bike)
		van.release_fixed_bikes(bike, station)
		expect(van.available_bikes).to eq []
	end

	it 'if tries to release broken bikes to the station, raises an error' do
		van.dock(bike)
		expect {van.release_broken_bikes(bike,station)}.to raise_error RuntimeError
	end


end