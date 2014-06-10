module BikeContainer

	def bikes
		@bikes ||= []
	end

	def bike_count
		bikes.count
	end

	def release bike
		@bikes.delete(bike)
	end

	def dock bike
		return "Is full!" if full?
		return "Cannot dock the same bike twice" if already? bike
		bikes << bike
	end

	def full?
		bike_count == @capacity
	end

	def already? bike
		 @bikes.include? bike
	end

	def available_bikes
		@bikes.reject(&:broken?)
	end

	def broken_bikes
		@bikes.select(&:broken?)
	end

	def release_broken_bikes bike, container
		release_and_dock broken_bikes, container
	end

	def release_fixed_bikes bike, container
		release_and_dock available_bikes, container
	end

	def release_and_dock(bikes, container)
		bikes.each do |bike|
			release(bike)
			container.dock(bike)
		end
	end
end