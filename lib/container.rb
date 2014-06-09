module BikeContainer

	ALL_BROKEN_BIKES = Proc.new{|bike| bike.broken?}
	
	def bikes
		@bikes ||= []
	end

	def bike_count
		bikes.count
	end

	def dock bike
		raise "Is full!" if full?
		@bikes << bike
	end

	def release bike
		@bikes.delete(bike)
	end

	def full?
		bike_count == @capacity
	end

	def available_bikes
		@bikes.reject(&ALL_BROKEN_BIKES)
	end

	def broken_bikes
		@bikes.select(&ALL_BROKEN_BIKES)
	end

end