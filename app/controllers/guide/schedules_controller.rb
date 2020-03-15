class Guide::SchedulesController < ApplicationController
	def index
		@schedules = Schedule.where(guide_id: current_guide) #current_guideのみの閲覧として制限
	end

	def show
		@schedule = Schedule.find(params[:id])
		@tourist = @schedule.tourist #schedule のもとでのtouristとする
	end

	def create #追記する
		@schedule = Schedule.new(schedule_params) #guide.idは tourist/guides/showよりhiddenで入手
		@schedule.tourist_id = current_tourist.id #tourist のログイン時の操作によるため
		if @schedule.save
			redirect_to root_path
		else
			redirect_to tourist_guide_path(current_tourist)
		end
	end

	def update #追記する
		@schedule = Schedule.find(params[:id])
		if params[:schedule][:status] == "実施予定"
			@schedule.status = "実施予定"
			@schedule.update(status: @schedule.status)
			redirect_to root_path
		elsif params[:schedule][:status] == "実施不可"
			@schedule.status = "実施不可"
			@schedule.update(status: @schedule.status)
			redirect_to guide_schedules_path
		end
	end

	private
	def schedule_params
		params.require(:schedule).permit(:tourist_id, :guide_id, :plan, :status)
	end
end
