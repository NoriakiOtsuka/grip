class Admin::SchedulesController < ApplicationController
	def show
		@schedule = Schedule.find(params[:id]).order(plan: "DESC")
		@tourist = @schedule.tourist
		@guide = @schedule.guide
	end
end
