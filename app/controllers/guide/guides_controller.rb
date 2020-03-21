class Guide::GuidesController < ApplicationController
	def index
		@guides = Guide.where(region: guide_search_params[:region])
	end

	def show
		@guide = Guide.find(params[:id])
	end

	def create
	end

	private
	def guide_search_params
		params.require(:guide).permit(:region)
	end
end