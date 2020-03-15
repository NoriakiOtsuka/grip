class Tourist::GuidesController < ApplicationController
	def index
		@guides = Guide.all
	end

	def show
		@guide = Guide.find(params[:id])
		@schedule = Schedule.new #viewでcontrollerをtour/guidesの指定してるけど、schedule直接でもできるかな？
	end
end
