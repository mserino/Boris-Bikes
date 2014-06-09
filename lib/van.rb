require_relative 'container'
class Van
	include BikeContainer

	DEFAULT_CAPACITY = 15
	attr_accessor :capacity

	def initialize
		@bikes ||= []
		@capacity = DEFAULT_CAPACITY
	end

end