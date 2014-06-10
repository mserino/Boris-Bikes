require_relative 'container'
class Station

	include BikeContainer

	DEFAULT_CAPACITY = 10

	attr_accessor :capacity

	def initialize
		@bikes ||= []
		@capacity = DEFAULT_CAPACITY
	end
end