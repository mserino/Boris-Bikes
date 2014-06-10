require './lib/container'

class Container; include BikeContainer; end

describe BikeContainer do

	let(:bike) { Bike.new }
	let(:container) { Container.new }
	let(:other_container) { Container.new }

	it 'can accept a bike' do
		expect(container.bike_count).to eq 0
		container.dock(bike)
		expect(container.bike_count).to eq 1
	end

	it 'can release a bike' do
		container.dock(bike)
		container.release(bike)
		expect(container.bike_count).to eq 0
	end

	it 'should know if a bike has already been docked' do
		container.dock(bike)
		expect(container.already?(bike)).to be_true
	end

	it 'cannot accept the same bike twice' do
		container.dock(bike)
		expect(container.dock(bike)).to eq "Cannot dock the same bike twice"
	end

	it 'should provide a list of all available bikes' do
		working_bike = Bike.new
		broken_bike = Bike.new
		broken_bike.break!
		container.dock(working_bike)
		container.dock(broken_bike)
		expect(container.available_bikes).to eq [working_bike]
	end

	it 'should provide a list of all broken bikes' do
		working_bike = Bike.new
		broken_bike = Bike.new
		broken_bike.break!
		container.dock(working_bike)
		container.dock(broken_bike)
		expect(container.broken_bikes).to eq [broken_bike]
	end

	it 'can release all the broken bikes' do
		bike.break!
		container.dock(bike)
		container.release_broken_bikes(bike, other_container)
		expect(other_container.broken_bikes).to eq [bike]
	end

	it 'can release all the fixed bikes' do
		container.dock(bike)
		container.release_fixed_bikes(bike, other_container)
		expect(other_container.available_bikes).to eq [bike]
	end

end