class Admin::SchedulesController < ApplicationController
	def show
		@schedule = Schedule.find(params[:id])
		@tourist = @schedule.tourist
		@guide = @schedule.guide
	end
end
