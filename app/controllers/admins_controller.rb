class AdminsController < ApplicationController
	def top
		@schedules = Schedule.all
	end
end
