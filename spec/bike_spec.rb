require 'bike'

describe Bike do

	it 'is not broken' do
		bike = Bike.new
		expect(bike).not_to be_broken
	end

	it 'can be broken' do
		bike = Bike.new
		bike.break!
		expect(bike).to be_broken
	end

	it 'can be fixed' do
		bike = Bike.new
		bike.break!
		bike.fix!
		expect(bike).not_to be_broken
	end
	
end