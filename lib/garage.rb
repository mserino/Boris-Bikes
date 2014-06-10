require_relative 'container'

class Garage
	include BikeContainer

	DEFAULT_CAPACITY = 10
	attr_accessor :capacity

	def initialize
		@bikes ||= []
		@capacity = DEFAULT_CAPACITY
	end

	def fix_broken_bikes bike
		broken_bikes.each do |bike|
			bike.fix!
		end
	end
end