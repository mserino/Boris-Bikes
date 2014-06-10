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
		expect(van.dock(Bike.new)).to eq "Is full!"
	end
end