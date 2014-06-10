require_relative 'container'

class Van
	include BikeContainer

	DEFAULT_CAPACITY = 15
	attr_accessor :capacity

	def initialize
		@bikes ||= []
		@capacity = DEFAULT_CAPACITY
	end


	def release_broken_bikes bike, garage
		raise "There are no broken bikes here" if self.broken_bikes == []
		broken_bikes.each do |bike|
			release(bike)
			garage.dock(bike)
		end
	end

	def release_fixed_bikes bike, station
		raise "There are no fixed bikes here" if self.available_bikes == []
		available_bikes.each do |bike|
			release(bike)
			station.dock(bike)
		end		
	end

end