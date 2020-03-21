class Tourist::ChatsController < ApplicationController
	def create
		@schedule = Schedule.find(params[:schedule_id])
		schedule = Schedule.find(params[:schedule_id])
		chat = Chat.new(chat_params)
		chat.schedule_id = schedule.id
		chat.tourist_id = current_tourist.id
		chat.guide_id = schedule.guide_id
		chat.sender = true
		chat.save
		#redirect_to request.referer #ajaxより

		@schedule = Schedule.find(params[:schedule_id])
		@tourist = @schedule.tourist
		@guide = @schedule.guide
		@chat = Chat.new
		@chats = @schedule.chats
	end

	private 
	def chat_params
		params.require(:chat).permit(:message)
	end
end
