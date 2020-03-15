class Tourist::TouristCommentsController < ApplicationController
	def create
		comment = TouristComment.new(tourist_comment_params)
		comment.tourist_id = current_tourist.id
		schedule = Schedule.find(params[:schedule_id])
		comment.guide_id = schedule.guide_id
		comment.save
		redirect_to request.referer
	end

	def destroy
		comment = TouristComment.find(params[:format])
		comment.destroy
		redirect_to request.referer
	end

	private 
	def tourist_comment_params
		params.require(:tourist_comment).permit(:comment)
	end
end
