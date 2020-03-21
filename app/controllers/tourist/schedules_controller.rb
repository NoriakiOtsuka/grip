class Tourist::SchedulesController < ApplicationController
	def index
		@schedules = Schedule.where(tourist_id: current_tourist) #current_touristのみの閲覧として制限
	end

	def show
		@schedule = Schedule.find(params[:id])
		@tourist = @schedule.tourist #schedule のもとでのtouristとする
		@guide = @schedule.guide

		@comment = TouristComment.new

		@chat = Chat.new
		@chats = @schedule.chats
	end
end
