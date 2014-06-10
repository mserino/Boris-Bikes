require 'garage'

describe Garage do

	let(:garage) { Garage.new }
	let(:bike) { Bike.new }
	let(:van) { Van.new }
	let(:station) { Station.new }

	it 'should know when it\'s full' do
		expect(garage).not_to be_full
		10.times { garage.dock(Bike.new) }
		expect(garage).to be_full
	end

	it 'should not accept a bike when is full' do
		10.times { garage.dock(Bike.new)}
		expect(garage.dock(Bike.new)).to eq "Is full!"
	end

	it 'should be able to fix a bike' do
		bike.break!
		station.dock(bike)
		station.release_broken_bikes(bike, van)
		van.release_broken_bikes(bike, garage)
		garage.fix_broken_bikes(bike)
		expect(bike).not_to be_broken
	end

	it 'should be able to fix all the bikes at once' do
		bike1 = Bike.new
		bike2 = Bike.new
		bike1.break!
		bike2.break!
		station.dock(bike1)
		station.dock(bike2)
		station.release_broken_bikes(bike, van)
		van.release_broken_bikes(bike, garage)
		garage.fix_broken_bikes(bike)
		expect(garage.broken_bikes).to eq []
	end
end