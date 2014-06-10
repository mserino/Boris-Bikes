require 'person'

describe Person do

	let(:person) { Person.new }
	let(:station) { Station.new }
	let(:bike) { Bike.new }

	it 'has no bike after initialized' do
		expect(person).not_to have_bike
	end
	
	it 'can rent a bike' do
		person.rent_bike_from(station, bike)
		expect(person).to have_bike
	end

	it 'can ride the bike' do
		person.rent_bike_from(station, bike)
		person.ride(bike)
		expect(person).to be_riding
	end

	it 'cannot ride a bike if hasn\'t rented one first' do
		expect(person.ride(bike)).to eq "You haven\'t any bike"
	end

	it 'cannot rent the bike if is broken' do
		bike.break!
		station.dock(bike)
		person.rent_bike_from(station, bike)
		expect(person.rent_bike_from(station, bike)).to eq "You cannot rent this bike, it\'s broken!!"
	end

	it 'when riding can fall down and break it' do
		person.rent_bike_from(station, bike)
		expect(bike).to receive(:break!)
		person.can_fall_down_from(bike)
	end

	it 'can return the bike to the station' do
		person.rent_bike_from(station, bike)
		person.return_to(station, bike)
		expect(person).not_to have_bike
		expect(station.bike_count).to eq 1
	end
	
end