require_relative 'container'
class Station

	include BikeContainer

	DEFAULT_CAPACITY = 10

	attr_accessor :capacity

	def initialize
		@bikes ||= []
		@capacity = DEFAULT_CAPACITY
	end

	def release_broken_bikes(bike, van)
		raise "There are no broken bikes here" if self.broken_bikes == []
		
		broken_bikes.each do |bike|
			release(bike)
			van.dock(bike)
		end
	end

end