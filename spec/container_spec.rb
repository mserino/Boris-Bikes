require './lib/container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) { Bike.new }
	let(:container) { ContainerHolder.new }

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
		expect{ container.dock(bike)}.to raise_error RuntimeError
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

end