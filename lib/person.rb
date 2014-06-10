require_relative 'container'

class Person
	include BikeContainer

	def initialize
		@bikes ||= []
		@riding = false
	end

	def has_bike?
		bike_count == 1
	end

	def rent_bike_from station, bike
		return "You cannot rent this bike, it\'s broken!!" if bike.broken? == true
		dock(bike)
		station.release(bike)
	end

	def riding?
		@riding
	end

	def ride bike
		return "You haven\'t any bike" if has_bike? == false		
		@riding = true
	end

	def return_to station, bike
		release(bike)
		station.dock(bike)
	end

	def casual
		[false, false, false, true].sample
	end

	def can_fall_down_from(bike)
		if casual == true
			bike.break!
		end
	end

end